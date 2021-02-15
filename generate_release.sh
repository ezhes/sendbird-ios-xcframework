make_links() {
    for target in "universal-simulator" "universal-hardware"; do
        rm -rf "../SendBirdSDK.xcframework/$target" > /dev/null 2>&1 &&
        cp -r ../components "../SendBirdSDK.xcframework/$target"
        #ln -s "components" "../$target"
        #retval=$?
        #if [ $retval -ne 0 ]; then
        #    echo "Symlink failed"
        #    return $retval
        #fi
    done
    return
}

rm -rf components > /dev/null 2>&1
mkdir  components
cd components
echo "Downloading latest..."
curl -LO https://github.com/sendbird/sendbird-ios-framework/releases/latest/download/SendBirdSDK.framework.zip &&
echo "Unzipping..." &&
unzip SendBirdSDK.framework.zip &&
echo "Unpacking..." &&
mv Carthage/Build/iOS/SendBirdSDK.framework SendBirdSDK.framework &&
mkdir dSYMs &&
mv Carthage/Build/iOS/SendBirdSDK.framework.dSYM dSYMs/SendBirdSDK.framework.dSYM &&
echo "Creating links..." &&
make_links
echo "Cleaning before packaging..." &&
rm -rf Carthage &&
rm -rf SendBirdSDK.framework.zip &&
echo "Generating binary resource package..." &&
cd ../ &&
zip -r SendBirdSDK.xcframework.zip SendBirdSDK.xcframework &&
echo "Done"

echo "To update the package, replace the hash below in Package.swift, update the URL to the expected URL for the new version, commit and push, and then create a release on Github"
shasum -a 256 SendBirdSDK.xcframework.zip
