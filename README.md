
<img src="https://ip.festo-didactic.com/InfoPortal/Robotino/Images/4_Robotino.jpg" alt="drawing" width="200" align="right"/></p>

# ✨RobotinoTemplate✨

sheesh

## What is this?

This is a template project for the [RobotinoLib](https://github.com/HerrNamenlos123/RobotinoLib). The goal is to make working with the Festo Robotino as easy as possible.

## Building

### Windows
<details>
<summary>Installation instructions for Windows 64-bit</summary>

#### Requirements

 - [Microsoft Visual Studio 2019](https://visualstudio.microsoft.com/de/downloads/) - Other IDEs can be used by editing `generate-win.bat`
 - [git](https://git-scm.com/downloads) - Recommended for cloning the repository
 - [RobotinoLib](https://github.com/HerrNamenlos123/RobotinoLib) - Must be fully built and installed

#### Generating from the template (Recommended)
  
This repository is a template, which makes it very easy for you to create your own Github repository from this template.
For this method you must have a Github account and must be logged in. If you do not want to use git for your project, go to [Downloading the ZIP-file](#Downloading-the-ZIP-file).
 
##### Part 1:
 + Click the green `Use this template`-button at the top of this page, enter a name, choose Public or Private and click Create
 + Now you have your own Github repository
 + In the File Explorer, navigate to the target directory, a location where it can stay without being deleted accidentally  
   (e.g. `C:\dev\` or `Documents`, not the `Download` folder)
 + Type `cmd` in the address bar at the top and press Enter, a command line should pop up
 + Press this button in your own Github repository to copy the path
 + Type `git clone ` in the console and right-click to paste, then press Enter.  
   Example: `git clone https://github.com/YOUR_NAME/YOUR_PROJECT.git` 
 + When the command has finished, close the console and navigate to the new folder in the File Explorer
<img src="https://user-images.githubusercontent.com/44909261/139955315-ebe65a3d-c92d-4e49-ac45-1ed801443cb7.png" alt="drawing" width="200" align="right">
 
#### Downloading the ZIP-file

##### Part 1:
 - Download this repository's zip-file by using the `Code` button at the top of this page
 - Extract the zip file to a working directory
   (e.g. `C:\dev\` or `Documents`, not the `Download` folder)
   
 - Once this has finished, navigate to the extracted folder and continue with [part 2](#Part-2)
  
##### Part 2:
 - Now, double-click the file `generate-win.bat`, this will generate everything and open Visual Studio for you
 - Finally, in Visual Studio, build the project `BUILD_ALL` in the project explorer
 - After compilation, the library is ready to use. Check out the [RobotinoTemplate](https://github.com/HerrNamenlos123/RobotinoTemplate) for instructions on how to use it.

 
</details>

### Linux
<details>
<summary>Installation instructions for Linux distributions</summary><br \>

This library was tested on Debian 11
 
#### Requirements

 - git: `sudo apt install git`
 - make: `sudo apt install build-essential`
 - Qt5: `sudo apt install qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools`

#### Building

 - Navigate to a working directory and clone:  
 `git clone --recursive https://github.com/HerrNamenlos123/RobotinoLib.git`
 - Generate the project files: `./generate-linux.sh`
 - Build the library: `cd build` and `make`
 - Install the library: `cd ..` and `sudo ./install-linux.sh`
 - Now the the library is ready to use. Check out the [RobotinoTemplate](https://github.com/HerrNamenlos123/RobotinoTemplate) for instructions on how to use it.

</details>







## Building

## Windows
+ [Install Robotino API 2 for Visual Studio 2019](https://wiki.openrobotino.org/index.php?title=API2)
+ `git clone --recursive https://github.com/HerrNamenlos123/RobotinoTemplate.git`
+ Double-click ```generate-win.bat```
+ Open `RobotinoTest.sln` file in Visual Studio 2019 and build

## Linux
+ Not implemented/tested yet
