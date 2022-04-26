# Tag Windows Folder
Script to set a tag on a Windows folder.

## Introduction
This script was originally made by Pinjoy in 2-10-2019 on a Google Drive with no license. I have changed it to improve the overall experience and uploaded it to GitHub to keep it maintained and alive.

## Installation
Pinjoy has done a YouTube video for it, where you can use the modified file in this repo instead: https://youtu.be/vyFhSdm4gD8

However, we can improve it using a different registry key so that you just right click the folder you want to change the tag on.

Regedit address: `Computer\HKEY_CLASSES_ROOT\Folder\shell\Tag Folder\command`

Value: `cmd /c start "" /d "%1" /min "<path>\Tag_Folder.bat"`

Credits to Ignat for the registry key suggestion on [StackOverflow](https://superuser.com/questions/1263318/how-to-add-tags-to-a-folder-in-windows-10#comment2558150_1408215).
