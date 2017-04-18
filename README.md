# assignment_web_server
Andrea A

[A Ruby web server project from the Viking Code School](http://www.vikingcodeschool.com)

# To run the files

```ruby first_server.rb```

To run the server

To see the output in the browser
```localhost:8080 ```

To see the output on the command line, open a PRY or IRB window:
```curl localhost:8080```

The output will be as follows:
Hello World
Hello-er World-er

# Building the client to act as a web browser

Open a PRY or IRB window

```
# Open URI is another Ruby standard library
#   which only supports GET requests
require 'open-uri'
open('http://localhost:8080') do |f|
    f.each_line{ |line| puts line }
end```