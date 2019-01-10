# Heroku Notifications

This project is designed to provide Mac OS developers with System Notifications when a Heroku event has happened. For instance, a new code push will display a notification when the build has succeeded.

To run, simply execute `./setup` from this current directory. The scripts should automatically create `launchctl` compatible `plist` files on your system and add them to your `launchd` daemon.

This utilizes [serveo.net](https://serveo.net) to create a secure SSH connection which allows Heroku to hit a public IP address while your machine can handle the requests. It also utilizes a very basic Sinatra server to handle the POST request from Heroku.

This does require you to enable [App Webhooks](https://devcenter.heroku.com/articles/app-webhooks) via Heroku. It will respond with whatever events you select for that given webhook (so you can customize it to what you are interested in).
