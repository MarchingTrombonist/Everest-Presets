# Everest Presets
## Overview
This is a tool that allows you to create custom presets of mods for Celeste's mod launcher Olympus. I created this beacuse I got annoyed with having to disable all the dependencies when I wanted to use a different map pack.

![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/ff03b71f-8bc3-4a7b-94e3-6e5cb106f480)


## Installation
If you don't have AHK installed, download Everest Presets.exe.

If you do have AHK installed, you can also download the original file.

Place it into Celeste\Mods (where your blacklist.txt is). 



### Can't find Celeste\Mods?
![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/a5066cbb-54dd-4022-8be1-dfcf2088e31e)

Try running Olympus and open the mods folder.

![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/1ceec919-c316-4f50-b381-1909110f9ab4)
![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/541b31ed-0c97-4095-abc3-48f615bdd42b)

## Use
Run it once, and it should create a preset folder.

![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/1e7373f5-0adc-424b-8b47-121e175ab02e)

Place your presets in that folder and run it again.

Select the individual mods or entire presets you would like to use.

![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/ff03b71f-8bc3-4a7b-94e3-6e5cb106f480)

Click update. This will edit your blacklist.txt.

![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/10353b14-dd1c-4527-b446-02dac49fd729)

Launch Everest! When you do, make sure to click the "Install Missing Dependencies" button. If they're already installed, this will just edit the blacklist and load them like normal.

![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/f277bdf4-b097-4ddb-8aa1-1130f04e3af7)

![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/d21aed23-d57d-42e4-ba35-9038c090152a)

## Presets
A preset consists of any mods that you would like to have easy access to. You can add comments with \#, check a mod by default with \*, or even check the entire preset by default with \*\*ALL\*\*

When first run, it will generate an example preset. This file will be ignored, so you don't have to worry about it cluttering up your GUI.

![image](https://github.com/MarchingTrombonist/Everest-Presets/assets/58573254/f52de08f-16f2-4e6e-b743-0eb5cb3c1324)

### More details
Any leading whitespace or blank lines are ignored

\# Ignores any text after it on the same line

\* as the first character in a line will make that mod on by default

\*\*ALL\*\*, \*\*     ALL\*\*, \*\* ALL \*\*, etc. (anything matching "\\\*\\\*\\s\*ALL\\s\*\\\*\\\*") as a line will default check any mod listed below it
