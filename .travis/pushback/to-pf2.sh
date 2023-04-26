export CHROMEDRIVER_VERSION=$(grep -o '<version>[0-9.]*</version>' pom.xml | head -1 | sed 's_<version>__' | sed 's_</version>__')
echo $CHROMEDRIVER_VERSION

git clone https://$GITHUB_TOKEN@github.com/sbtqa/page-factory-2.git
cd page-factory-2
git remote rm origin
git remote add origin https://$GITHUB_TOKEN@github.com/sbtqa/page-factory-2.git
printenv
echo $CHROMEDRIVER_VERSION
sed -i "s/webdriver.version = [0-9.]*/webdriver.version = $CHROMEDRIVER_VERSION/" plugins/html-plugin/src/test/resources/config/application.properties
sed -i "s/webdriver.version = [0-9.]*/webdriver.version = $CHROMEDRIVER_VERSION/" plugins/web-plugin/src/test/resources/config/application.properties
git add -A
git commit -m "bump chrome driver version by chromedriver-bin"
git pull origin master
#git push origin master