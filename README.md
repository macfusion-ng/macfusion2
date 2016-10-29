Macfusion 2
===========

[Macfusion][] brings servers from across the internet directly to your Mac's desktop!

![icon](http://i.imgur.com/zGp4o.png)

- Mount files and documents as a "Volume" in the Mac OS X Finder
- Work with your files using your favorite Mac OS X applications directly. No manual upload or download needed!
- Support for SSH (Secure Shell) and FTP (File Transfer)
- Uses your machine's native configuration for SSH, including support for private keys and custom settings.
- Quickly connect to any server using the *Quick Connect* dialog, accessible from Macfusion's optional menu item.


Download
========

You can download a [build of the development version][], currently only tested in Mac OS X Lion.

Remember that depending on the operating system you are using you will have to install any of the following dependencies:

- X11, OSX 10.8 needs a manual installation of [XQuartz][]; it is very likely that you already have this installed in your computer if you are using 10.7 or lower.
- For Mac OS X 10.6, you will need [MacFUSE][].
- For Mac OS X 10.7 and greater, you need [Fuse for OSX][], note that **you will need to check** the *"install MacFUSE compatibility layer"* option during the installation process, otherwise some parts of the software will be broken.

Roadmap
=======

- Update the icons and resources for a retina display resolution, if you are a designer and you can help, please contact me [@yoshikivb][].
- Fix as many bugs as possible.
- Release a stable 2.1 version in the near future.

Current fixes
=============

- Include a way to call a newer version of sshfs to work in OS X Lion and greater.
- Application no longer crashes when deleting a filesystem.
- Ability to expand the mount path, for example: `~/filesystem` to `/Users/yoshiki/filesystem`. 
- Modified the menu application to toggle between mount and un-mount filesystem.
- Added a checkbox to add (or not) a mounted filesystem into Finder's sidebar.
- Added the output of `git rev-parse --short HEAD` to the about window.

[Macfusion]:http://macfusionapp.org/
[MacFUSE]:http://code.google.com/p/macfuse/
[Fuse for OSX]:http://osxfuse.github.com
[XQuartz]:http://xquartz.macosforge.org
[build of the development version]:https://github.com/ElDeveloper/macfusion2/releases/tag/2.1-dev
[@yoshikivb]:https://twitter.com/yoshikivb
