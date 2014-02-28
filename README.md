honishi objective-c test template
==
reference
--
* xctest-additions
    * https://github.com/iheartradio/xctest-additions

setup using cocoapods
--
````
vi podfile
pod install
````
then `open` the generated workspace.

.gitignore
--
* based on https://github.com/github/gitignore/blob/master/Objective-C.gitignore
* and added the following pod-related lines from https://gist.github.com/brynbellomy/3288122
````
*.xcworkspace
!default.xcworkspace
````

