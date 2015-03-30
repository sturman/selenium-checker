### Selenium-checker

The Selenium-checker is the simple Shell script written to automate the checking newer version of Selenium standalone server available at [selenium release storage](selenium-release.storage.googleapis.com/index.html) and notify about that the user.

Note: you may add the execution of the following script to the Cron with the following commands in terminal:

* `crontab -e`
* add this line `*/30 * * * * /path/to/selenium_checker.sh` to perform check each half hour
* close Nano editor with `Ctrl+X`
* confirm saving the new task for Cron `Y`
* expected result `crontab: installing new crontab`

**Note:** each script execution performs the request to the remote server. So make sure you have an access to the [selenium-release.storage.googleapis.com/index.html](selenium-release.storage.googleapis.com/index.html) and be careful with frequency of requests.

**References:** [http://habrahabr.ru/post/47892/#comment_7143538](http://habrahabr.ru/post/47892/#comment_7143538) and [http://habrahabr.ru/post/126849/#comment_4183443](http://habrahabr.ru/post/126849/#comment_4183443)
