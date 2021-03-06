# Build the site
jekyll build

# Clean the directory
echo "Cleaning directory..."
cd ../cmccomb.github.io
git rm -rf ./*
git clean -fxd
cd ..

# Copy over the completed website
echo "Copying static files"
mv ~/GitHub/cmccomb.github.io-source/_site/* ~/GitHub/cmccomb.github.io/
rm -rf ~/GitHub/cmccomb.github.io-source/_site/
rm ~/GitHub/cmccomb.github.io/update_site.sh

# Touch nojekyll
touch ~/Github/cmccomb.github.io/.nojekyll

# Add commit and push for deployment
current_date_time="`date +%Y-%m-%d:%H:%M:%S`";
cd cmccomb.github.io
git add ./*
git commit -a -m $current_date_time
git push

# Add commit and push for source
cd ../cmccomb.github.io-source
git add ./*
git commit -a -m $current_date_time
git push
