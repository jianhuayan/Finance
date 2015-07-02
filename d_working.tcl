#! /usr/bin/tclsh

foreach i [exec cat a.txt] {
puts "i is $i.\n"
exec wget "http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,$i&f=nsl1op&e=.csv" 
}
