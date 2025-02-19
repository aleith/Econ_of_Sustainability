use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- User editable content
set subjectFolderNames to {"02 Prescribed readings", "03 Lecture notes & slides", "04 Additional readings", "05 Self-assessment exercises", "06 Presecribed tutorial activities", "07 Links to additional data and resources", "08 scripts and data wrangling stuff", "09 Other students' resources"}
set assessmentFolderNames to {"Assessment 1", "Assessment 2", "Assessment 3"}
set assessmentSubfolderNames to {"01 Drafts", "02 Datasets, primary references provided by lecturer", "03 Images", "04 InDesign", "05 Exports (PDFs etc)", "06 Papers, texts, referencing files", "07 Feedback on early attempts", "99 Other student work"}

-- Define the domain for the plist file
property plistDomain : "com.usefuldesign.au.folderscript"
property plistKey : "savedPath"

-- Function to write a file path to the plist
on writePathToPlist(thePath)
	try
		do shell script "defaults write " & plistDomain & " " & plistKey & " " & quoted form of POSIX path of thePath
	on error errMsg number errNum
		display dialog "Failed to save the path to the plist. Error: " & errMsg & " (Error Number: " & errNum & ")" buttons {"OK"} default button 1
	end try
end writePathToPlist

-- Function to read the file path from the plist
on readPathFromPlist()
	try
		set thePath to do shell script "defaults read " & plistDomain & " " & plistKey
		return thePath
	on error
		return missing value
	end try
end readPathFromPlist

-- Function to create folders
on createFolders(baseFolder, folderNames)
	repeat with folderName in folderNames
		set newFolderPath to baseFolder & "/" & folderName
		do shell script "mkdir -p " & quoted form of POSIX path of newFolderPath
	end repeat
end createFolders

-- *** Main Script ***
-- Step 1: Prompt the user to select a subject folder
set subjectFolder to choose folder with prompt "Please select a folder to create your standard subject organizing folders in:"
if subjectFolder is missing value then
	display dialog "No folder selected. Exiting script." buttons {"OK"} default button "OK"
	return
end if

set subjectFolderPath to POSIX path of subjectFolder

-- Step 2: Validate the selected folder
tell application "System Events"
	if not (exists subjectFolder) then
		display dialog "The selected item is not a folder. Please select a valid folder." buttons {"OK"} default button 1
		return
	end if
end tell

-- Step 3: Create subject folders in the selected directory
createFolders(subjectFolderPath, subjectFolderNames)

-- Step 4: Ask if the user wants the Assessments folder in the same subject folder or elsewhere
set createInSameFolder to button returned of (display dialog "Do you want to create an 'Assessments' folder inside the subject folder?" buttons {"No", "Yes"} default button "Yes")
if createInSameFolder is "Yes" then
	set assessmentsBaseFolder to subjectFolderPath
	-- Create the "01 Assessments" folder inside the subject folder
	set assessmentsFolder to assessmentsBaseFolder & "/01 Assessments"
	do shell script "mkdir -p " & quoted form of POSIX path of assessmentsFolder
	set presetFolder to assessmentsBaseFolder
else
	-- Step 5: Check for a saved path in the plist
	set savedPath to readPathFromPlist()
	
	if savedPath is missing value then
		-- No saved path, use the parent directory of the subject folder as default
		set presetFolder to (POSIX file (do shell script "dirname " & quoted form of subjectFolderPath)) as alias
	else
		-- Use the saved path as the default location
		set presetFolder to (POSIX file (do shell script "dirname " & quoted form of savedPath)) as alias
	end if
	
	-- Step 6: Prompt user to select the Assessments folder location, defaulting to the saved path or parent directory
	set chosenFolder to choose folder with prompt "Please select the location for your centralized Assessments folder:" default location presetFolder
	
	if chosenFolder is not missing value then
		set assessmentsBaseFolder to POSIX path of chosenFolder
		-- Save the selected path to the plist
		writePathToPlist(assessmentsBaseFolder)
		-- Create a new folder named after the subject inside the selected assessments location
		set assessmentsFolder to assessmentsBaseFolder & "/" & (do shell script "basename " & quoted form of subjectFolderPath)
		do shell script "mkdir -p " & quoted form of POSIX path of assessmentsFolder
	else
		display dialog "No folder selected for Assessments. Exiting script." buttons {"OK"} default button "OK"
		return
	end if
end if

-- Step 7: Create assessment folders and subfolders in the selected directory
createFolders(assessmentsFolder, assessmentFolderNames)

repeat with assessmentFolder in assessmentFolderNames
	set assessmentFolderPath to assessmentsFolder & "/" & assessmentFolder
	createFolders(assessmentFolderPath, assessmentSubfolderNames)
end repeat

-- Step 8: If Assessments folder is in a different location, create aliases
if assessmentsBaseFolder is not subjectFolderPath then
	try
		do shell script "ln -s " & quoted form of assessmentsFolder & " " & quoted form of (subjectFolderPath & "/01 Assessments")
	on error errMsg number errNum
		display dialog "An error occurred while creating the alias: " & errMsg & " (Error Number: " & errNum & ")" buttons {"OK"} default button 1
	end try
end if

-- Step 1: Open the subject folder in Finder
tell application "Finder"
	open folder subjectFolder
end tell

-- Step 2: Use a shell script to sort the files by name in ascending order

(*
do shell script "
osascript -e 'tell application \"Finder\" 
	set current view of front window to list view
	set sort column of list view options of front window to column id name column
	set sort direction of list view options of front window to normal
end tell'
"
*)


-- Step 3: Open the preset folder in Finder
tell application "Finder"
	open folder (POSIX file presetFolder as alias)
end tell

-- Step 4: Use a shell script to sort the files by name in ascending order for the preset folder
do shell script "
osascript -e 'tell application \"Finder\" 
	set current view of front window to list view
	set sort column of list view options of front window to column id name column
	set sort direction of list view options of front window to normal
end tell'
"

-- Step 10: Display a success message
tell application "Finder"
	display dialog "Folders created successfully!" buttons {"OK"} default button 1
end tell