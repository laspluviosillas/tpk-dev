Unorganized thoughts on how the server is setup.
Once I'm done, I'll organize these properly into a readme markdown file.

1. Follow Railscast' Deploying to a VPS exactly as described. Make sure to repeat the steps used for database.yml for the email.yml file.
2. Install redis based on the linode guide: http://library.linode.com/databases/redis/ubuntu-10.04-lucid
3. Install rbenv-sudo patch.
4. Install God based on guide in this gitfile: https://gist.github.com/1275333.
   Note that god-service init file configuration requires different ruby and god bin paths to work with rbenv.
   when setting up, make sure to specify the right path to the ruby and god bins, otherwise the init script won't work.
  
   God MUST be installed on the root user for things to work. make sure the god-service init paths are set to the ROOT init paths


NOTE:
as part of setup symlink god bin to /usr/local/bin/

NOTE: If any of the gems are not picking up, try "rbenv rehash" and restarting the unicorn init script by running the STOP and START command. DO NOT user the unicorn init script's RESTART command, as it does not fix the problem.

LOOK INTO POSSIBILITIES OF MOVING REDIS AND GOD SETUP INTO CAPISTRANO DEPLOY FILE!!!!