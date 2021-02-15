# What is this?

The [SendBird SDK for iOS](https://github.com/sendbird/sendbird-ios-framework) is only presently available as a CocoaPod/Carthage package which of course is not compatible with Swift Package Manager. This repo hosts an SPM compatible package for the iOS SendBird SDK. Releases to GitHub are (for the moment) manual and so new versions will only be released as needed (or upon request).

# Details

The SendBird SDK is distributed only as a FAT binary framework. This makes converting it to a Swift Package doubly difficult as SPM not only requires us to use the XCFramework format (distinct from the classic framework model) and that we include hashes of all our releases. This means that we can't simply use git magic to add a package manifest and instead need to manually process the package and recreate it. The script `./generate_release.sh` helps to automate this by downloading the latest release and repackaging it as an XCFramework. Repackaging is unfortunately a very wasteful process (for the moment) since instead of manually slicing the FAT framework, we just include the entire framework for each architecture/variant. Some workarounds were attempted here (namely symlinks) in order to reduce release sizes, however SPM's unarchive function did not support any of them and so none were used. 

