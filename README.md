### OS
This is a work to create an operating system from the ground up.
The goal of this OS is to implement a simple kernel that will run programs compatible with linux.
After sufficient system calls are implemnented, I would like to write a shell to make the OS usable.

## Compilation
The make file should take care of compiling all the code for the operating system.
Typeing
  'make'
will compile the .c files, assemble and link the necassary assembly files.

## Running the OS
to run the OS, bochs is required. The configuration file, bochsrc.bxrc provides the box settings that will let the OS run. 
If you want to configure your bochs manually, you simply need to set the boot device to read os.img.
Other than the boot medium, the default bochs settings are used.

## Roadmap
# What's been done
  Currently the operating system has the assembly necassary to load the initial data into memory, switch to long mode, and call main.
  Printing characters to screen is currently done in assembly and main.
# @TODO short-term
  Write screen device drivers, functions to print text to the screen and scroll.
  
# TODO long-term
  Many device drivers
    keyboard
    screen
    storage
  File system
  Process Scheduling
