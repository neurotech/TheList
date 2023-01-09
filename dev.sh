echo "Building TheList and installing to WoW directories."

echo "Creating TOC file..."
touch TheList.toc.tmp
cat TheList.toc > TheList.toc.tmp
sed -i "s/@project-version@/$(git describe --abbrev=0)/g" TheList.toc.tmp

echo "Copying assets to Modern..."
mkdir -p /h/games/World\ of\ Warcraft/_retail_/Interface/AddOns/TheList/
cp *.lua /h/games/World\ of\ Warcraft/_retail_/Interface/AddOns/TheList/
cp TheList.toc.tmp /h/games/World\ of\ Warcraft/_retail_/Interface/AddOns/TheList/TheList.toc

echo "Cleaning up..."
rm TheList.toc.tmp

echo "Complete."