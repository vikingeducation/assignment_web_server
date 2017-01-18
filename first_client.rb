require 'open-uri'

open("http://localhost:8080") {|f|
  f.each_line {|line| p line}
}