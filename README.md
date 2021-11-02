
<img src="https://ip.festo-didactic.com/InfoPortal/Robotino/Images/4_Robotino.jpg" alt="drawing" width="200" align="right"/></p>

# ✨RobotinoTemplate✨

sheesh

## What is this?

This is a template project for the [RobotinoLib](https://github.com/HerrNamenlos123/RobotinoLib). The goal is to make working with the Festo Robotino as easy as possible.

## How to use

### Generating from the template (Recommended)
  
This repository is a template, which makes it very easy for you to create your own Github repository from this template.
For this method you must have a Github account and must be logged in. If you do not want to use git for your project, go to [Downloading the ZIP-file](#Downloading-the-ZIP-file).
 
 - Use the green button at the top of this page to generate a repository from this template.
 - Now, clone your repository and build it

### Windows
<details>
<summary>Installation instructions for Windows 64-bit</summary>

#### Requirements

 - [Microsoft Visual Studio 2019](https://visualstudio.microsoft.com/de/downloads/) - Other IDEs can be used by editing `generate-win.bat`
 - [git](https://git-scm.com/downloads) - Recommended for cloning the repository
 - [RobotinoLib](https://github.com/HerrNamenlos123/RobotinoLib) - Must be fully built and installed
 
Alternatively, simply download the zip-file of this repository and extract it.
  
#### Building:
 - Double-click the file `generate-win.bat` and enter the name of your project, this will generate everything and open Visual Studio for you
 - That's it, simply press `Ctrl+F5` to compile and run the project. Now it's your turn to start developing by modifying `src/RobotinoAction.cpp`

 
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

 - Clone your Github repository which was generated from this template and navigate to it in the terminal
 - Generate the project files: `./generate-linux.sh`
 - Build the library: `cd build` and `make`
 - Run the executable: 'cd bin/YOUR_CONFIG' and './PROJECT_NAME'
 - That's it, now it's your turn to start developing by modifying `src/RobotinoAction.cpp`

</details>
