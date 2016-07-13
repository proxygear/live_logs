#LiveLogs

##What is live logs ?

It's a Rails Engine that displays app logs in your browser, live!
And .. It looks like this:

![Screen shot](https://raw.github.com/proxygear/live_logs/master/docs/screen_shot.jpg)

##Why it was created ?

Because a client asked me to perform the following 'Test-Task'
> Develop a simple RoR application that use backbone and marionette.js on the client side. The application scans any log file (development.log, syslog, ..) for updates. When a new line appears on the log file it is passed to the client and is rendered in one of two sections. Choose an arbitrary filtering rule of the new lines...

##Demo ?

    git clone 'git@github.com:proxygear/live_logs.git'
    cd live_logs
    bundle
    cd spec/dummy
    passenger start
    open http://localhost:3000

##Why passenger ?

Actually you can use whatever service you like that handle localy multiple requests simultenously.
Streaming request does not stop unless client cut the connection.
So if you use a 'single request at a time' solution, after starting streaming logs, your app will be stucked.
But, you can steal `$> echo 'test' > logs/my.log` to emulate traffic.

* Webrick is one at a time
* Puma can be tuned to allow simultaneous requests
* Passenger does the job
* For the others, RFDocs...

##How to use it ?

In your `Gemfile` add:

    gem 'live_logs', git: 'git@github.com:proxygear/live_logs.git'

In your `routes.rb`add:

    mount LiveLogs::Engine => "/whatver_path"

Then bundle your app, run your server and visit '/whatver_path'

##Does it works on Heroku ?

Nop or not as expected.
Heroku cut open connection after N seconds as far as I know.
Even if SourceEvent restart automagicaly broken connection, the streaming will restart at
file logs end minus ~ 25 lines.
So you'll see passing at each reconnection 25 lines already seen.
This may be fixed with a bunch of extra work,
that you may do it yourself.

##How does it works ?

It uses:

* Ruby 1.9+
* file-tail gem to keep reading log files
* Rails ActionController::Live to stream the logs
* Javascript EventSource to get a persistant connection
* MarionetteJS (before v2) in addition of Backbone (before v1) for the interactivity
* And zurb foundation because ... it's my default CSS Framework

##Needs, questions or feedbacks ?

Feel free to create [an issue](https://github.com/proxygear/live_logs/issues) and/or to [contact me](mailto:benoit@proxygear.com).

##Dependencies

* Rails 4+

##LICENSE

This project rocks and uses MIT-LICENSE.
