rm -rf components > /dev/null 2>&1
mkdir  components
cd components
echo "Downloading latest..."
curl -LO https://github.com/sendbird/sendbird-ios-framework/releases/latest/download/SendBirdSDK.xcframework.zip &&
echo "Unzipping..." &&
unzip SendBirdSDK.xcframework.zip &&
echo "Unpacking..." &&
#We need to search for the SDK since, for whatever reason, some builds have a zip file that has the entire developer's folder structure in them
#sdk_root_folder=$(find . -type d -name 'SendBirdSDK.xcframework' -print -quit)
#if [ -z "$sdk_root_folder" ]; then
#    echo "Could not find SendBirdSDK.xcframework";
#    exit 1
#fi
#
#mv "$sdk_root_folder" SendBirdSDK.xcframework &&
echo "Cleaning before packaging..." &&
rm -rf SendBirdSDK.xcframework.zip &&
echo "Generating binary resource package..." &&
zip -r SendBirdSDK.xcframework.zip SendBirdSDK.xcframework &&
echo "Done" &&

echo "To update the package, replace the hash below in Package.swift, update the URL to the expected URL for the new version, commit and push, and then create a release on Github" &&
shasum -a 256 SendBirdSDK.xcframework.zip
