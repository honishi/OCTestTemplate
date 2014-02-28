honishi objective-c test template
==
reference
--
* xctest-additions (https://github.com/iheartradio/xctest-additions)
* OCMock (http://ocmock.org)

setup using cocoapods
--
````
vi podfile
pod install
open OCTestTemplate.xcworkspace
````

.gitignore
--
* based on https://github.com/github/gitignore/blob/master/Objective-C.gitignore
* and added the following pod-related lines from https://gist.github.com/brynbellomy/3288122
````
*.xcworkspace
!default.xcworkspace
````
