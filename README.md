# Economics of Sustainability — GTD optomisers.
Shared student resources to `get things done` and `stay on track` for Masters in Economics of Sustainability candidates, Torrens Uni.

## Calendars 
All these calanders are of the public calendar type, so they can be subscribed to using the URL rather than needing to import them to your calendar application. Public subscriptions have the advantage of automatically staying up to date with any changes the author(s) make. For exmaple, towards the end of 2025 ai will add the dates for the 2026 trimesters. For exmaple I may need to fix an incorrect due date in a subject calendar. I've also exported these calendars as files so you may simply import them to upir favorite calender application, but they will not update automatically, that's up to you to take care of. 
### 1.   Economics of Sustainablility Calendar  
   [**Click here to subscribe**](https://calendar.google.com/calendar/u/0?cid=MWNkNWExMWEyNmMxN2E4ZjUyZDYwYWE1YWRiMDY0NDI3ZGM1MmQ3N2Q4NGY4Y2VkNjE2MjEwMzVlNDI4MDk3NkBncm91cC5jYWxlbmRhci5nb29nbGUuY29t).
    General acedemic dates for each trimester and mod-trimester breaks for each year,and census dates (withdrawal from subject cut-offs) [as listed on Torrens website]( https://www.torrens.edu.au/how-to-apply/key-dates).

### 2.  BECOSD402 (N04728) Foundations of Modern Money, Institutions and Markets
**[Click here to subscribe.](https://calendar.google.com/calendar/u/0?cid=NTllZDViYWIyNWY5NjhhYTM3ZmRhZjRmMDYxNzE0NDljYzVkNjNmMjViMzRkOWZiMDRjOTRjMDE2MzA1YTM1OUBncm91cC5jYWxlbmRhci5nb29nbGUuY29t)**. Assessment due dates and online tutorials etc T1, 2025.
  
## Applescripts
Scripts that can be run on macOS devices to speed up mundane processes. 

### 1. Make folders for a new subject
The script can be downloaded from the [Scripts folder of this respoitory](https://github.com/aleith/econsust/scripts) and opened in an Applescript editor like Apple's own `Script Editor` which comes preinstalled or the — superior in every way — Script Debugger (the free edition is fine for our purposes and the developers are retiring soon and will make the pro version open source later this year).
Once you have this script downloaded and opened in an editor you can just run it as is using the "Run" button or make seom edits to customise the directory (folder) names and nestings to be just how you like them.

The first thing the script asks you for is to show it where the new subject folder will live, this means choosing an existing folder, or making a new folder using the button in the bottom right of the dialog box and then chhoosing it. You select a folder by opening it and then clicking on "Choose" when showing the (probably empty) file listing inside it. In this example i'm in my top level folder for the Masters Course and I double click on "02 Course Materials" to open it and then click `"New Folder"` and name it "403 Example Subject". See the following three images for exmaples.

![Screenshot 2025-02-20 at 6 56 25 AM](https://github.com/user-attachments/assets/a58ef000-b068-4b12-aeeb-704149198620)

![Screenshot 2025-02-20 at 6 58 04 AM](https://github.com/user-attachments/assets/b7aa16b6-1ece-4d68-a9e7-8b82dc74f57a)

![Screenshot 2025-02-20 at 6 58 19 AM](https://github.com/user-attachments/assets/74607aa3-7691-4b1d-92c2-325cd0f86d4e)

The next question the script ask you is "Do you want to create an 'Assessments' folder inside the subject folder?" You can answer "Nowhere", "Inside" or "

Lines refering to new folder names for are line numbers 5-12. There will also be a folder names "01 Assessments" created but the user has the option of creating it in the same subject folder as these other 8 folders, or putting it in a seperate location for your Assessments. The reason I do this is that i share my subject folders with other students via iCloud and i dont wish to share my Assessment files, I want to keep them seperate. So it you answer "No" to the prompt asking "Do you want to create an 'Assessments' folder inside the subject folder?" you will then get asked where to locate the Assessments folder for this subject you ar creating and the script will create an *alias* to this folder back inside the Subject folder. (Hope that makes sense, just ask or experiment running the script if that is not clear enough). If you answer "Yes" to the prompt saing "Do you want to create an 'Assessments' folder inside the subject folder?" then the `01 Assessments` folder will be located inside the folder you choose as the Subject directory and named `01 Assessments`. No alias will be made if you answer "Yes" to the prompt.

As well as the top level folders there will be Module folders created in the `02 Presribed Readings` and `03 Lecture notes and slides` folders using the folder names listed in any of the subject module folder name objects listed so far as **`moduleFolderNamesForHealth601`**, **`modulesFolderNames402RealWorldMMT`**, **`modulesFolderNames608EEE`** objects declared on lines 26-77. You can add your own and there are two that just make generic names. The first generaic names one makes folders named `1.1`, `1.2`, `2.1`, `2.2` ... `6.1`, 6.2`. The other one makes folder names `1.`, `2`, `3`,... `12`. You need to edit the script to tell it which subject's module object you are wanting to use. In the future I'll add a dropdown list in the fiture but for now its a manual edit you need to maek for yourself on line , sorry about that.
