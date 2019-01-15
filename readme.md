Telegram bot with php + long poling.

More about long polling see this [article](https://www.pubnub.com/blog/2014-12-01-http-long-polling/).

More about Telegram API documentation see [doc](https://core.telegram.org/bots/api).

#### 1. Preparation
+ For Windows, make sure [XAMPP](https://www.apachefriends.org/index.html) installed. 
+ Start both XAMPP Apache (to run PHP) and MySQL.
+ Clone project into `htdocs` directory in XAMPP (default located at `C:\xampp\htdocs`).
+ Open [phpmyadin](http://127.0.0.1/phpmyadmin) and create database. Import `bot.sql` to database you created before.
+ Setup `BOT TOKEN` with token that get from telegram bot account. Also change <strong>$db</strong> variable value in <strong>config.php</strong> file with database name you created before.
   To create Telegram Bot, ask to <strong>BotFather</strong>. Before you can ask to <strong>BotFather</strong>, search by type `@BotFather` on Telegram search field. Follow <strong>BotFather</strong> directions to create new Telegram Bot.

#### 2. Execution
+ Run Command Line (Command Prompt in Windows) and poin it to project location.
+ Run `initListener.php`, `initProcessor.php`, `initSender.php` in the same time with command line. 
To run type `php` before file name. Example type `php initListener.php` to run `initListener.php`. 

#### 3. Enjoy
Start messaging with your bot.

#### Automatic Run Script With Task Scheduler (Windows Only)
Basic running php automatically by Task Scheduler [here](http://mukundtopiwala.blogspot.com/2012/07/run-php-script-automatically-on-windows.html).

You can run the script automaticaly by add it in Task Scheduler by the following step.
1. Make sure both XAMPP Apache and MySQL run automatically. 
   To make bot XAMPP Apache and MySQL run atomatically, you can follow this [Stack Overflow answer](https://stackoverflow.com/questions/20960296/how-to-start-apache-and-mysql-automatically-when-windows-8-comes-up)
2. Type `Task Scheduler` on Windows Search, then hit enter or using the <strong>Windows Key + R</strong> to open <strong>Run</strong> and type <strong>taskschd.msc</strong>. This will open Task Scheduler.
3. Under the actions panel, you can choose to create a basic task or create a task. Click <strong>Create Task</strong>.
4. The <strong>Create Task</strong> screen will appear. Select the <strong>General</strong> tab.
   + In the <strong>Name</strong> field, give the task a name. For example i named <strong>telegram-bot-listener</strong>
   + In the <strong>Description</strong> field, here you can describe what the task is for and what it will do. For example i fill it with <strong>Run Telegram Bot listener automatically</strong>
   + The last section is the <strong>Security Options</strong>. Here you can set who can run this task and if the task has admin right.
5. Select the <strong>Triggers</strong> tab.
    + Select <strong>New...</strong>
    + The <strong>New Trigger Window</strong> will appear. Here you have the option to set when the task will start.
        + Select when you would like the task to start in the <strong>Begin the task</strong> drop down menu. I chose <strong>On a schedule</strong>.
        + Modify the <strong>Settings</strong> area as desired. I Chose <strong>Daily</strong> on this section. 
        + In the <strong>Advanced Settings</strong> field, you can choose to delay task, repeat task, stop task, activate and expire. I prefer to leave these setting default.
        + <strong>Enabled</strong> is checked by default.
6. Select <strong>OK</strong>.
7. Select the <strong>Actions</strong>
   + select <strong>
New...</strong>
   + the <strong>New Action</strong> windows will open.
   + On the <strong>Action</strong> drop down, <strong>Start a program</strong> is set by default. Change it if desired.
   + Select <strong>Browse...</strong> next to the <strong>Program/script</strong> field. 
   + Browse php.exe (default located at <strong>C:\Xampp\php\php.exe</strong>). 
   + Fill <strong>Add arguments</strong> field with `-f c:\pathToHtdocs\fileName.php`. As example, `-f C:\xampp\htdocs\bot-telegram-php\initListener.php` to run <strong>initListener.php</strong>
   + Select <strong>OK</strong>.
8. Go to the tab <strong>Conditions</strong> tab.
You can change these if you'd like, but i recomended leaving these settings default.
9. Select the <strong>Settings</strong> tab. 
You can change these if you'd like. But, i recomended leaving these alone.
10. Select <strong>OK</strong>.
11. Repeat step 3 to step 10 for <strong>initProcess.php</strong> and <strong>initSender.php</strong>. Make sure to give different <strong>Name</strong> in <strong>General</strong> tab. As example <strong>telegram-bot-process</strong> for <strong>initProcess.php</strong> and <strong>telegram-bot-sender</strong> for <strong>initSender.php</strong>.
19. You have successfully setup a task scheduler. Next run it manualy by find it in <strong>Active Task</strong>, double click on it, then click <strong>Start</strong> or wait until the schedule arrived.
