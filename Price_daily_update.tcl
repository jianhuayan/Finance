#! /usr/bin/tclsh

#This is to update the asset price daily from Yahoo site: http://ichart.finance.yahoo.com/table.csv?s=YHOO&d=0&e=28&f=2010&g=d&a=3&b=12&c=1996&ignore=.csv

namespace eval Price_daily_update {
variable sn	#TICKER
variable a	#fromMonth-1
variable b 	#fromDay (two digits)
variable c	#fromYear
variable d 	#toMonth-1
variable e 	#toDay (two digits)
variable f 	#toYear
variable g 	#d for day, m for month, y for yearly
}

set today  [exec date +%F]

puts "today is $today"
# set yesterday = exec "date +%F --date='yesterday'"
set today_list [split $today "-"]
puts "today_list $today_list"
set a1 [lindex $today_list 1]
puts "FromeMonth is $a1"
set a [expr ($a1-1)]
puts "FromeMonth is $a"
set b [lindex $today_list 2]
set c [lindex $today_list 0]
set d1 [lindex $today_list 1]
set d [expr ($d1-1)]
set e [lindex $today_list 2]
set f [lindex $today_list 0]
puts "today is month $a1 day $b year $c" 
puts "a is $a\n"
puts "b is $b\n"
puts "c is $c\n"
puts "d is $d\n"
puts "e is $e\n"
puts "f is $f\n"

# get today's data from YAHOO finance site
set dayoftheweek [exec date +%a]
puts "day of the week is $dayoftheweek.\n"
set weekends {Sat Sun}
puts "weekends is $weekends.\n"

set comparison [string compare $dayoftheweek [lindex $weekends 1]]
puts "the value of comparision is $comparison.\n"
if {$comparison >= 0} {
# exec wget http://ichart.finance.yahoo.com/table.csv?s=YHOO&d=$d&e=12&f=$f&g=d&a=$a&b=12&c=$c&ignore=.csv
exec wget -O YHOO.csv "http://ichart.finance.yahoo.com/table.csv?s=YHOO&d=$d&e=$e&f=$f&g=d&a=$a&b=$b&c=$c&ignore=.csv"

puts "TODAY IS A WEEKDAY\n"
} else {
	puts "TODAY IS wEEKEND.\n"
}

# should add to catch ERROR 404 http error
# should add code to write to the log

# exec wget "http://ichart.finance.yahoo.com/table.csv?s=YHOO&d=4&e=13&f=2015&g=d&a=4&b=13&c=2015&ignore=.csv"
# The above url quotation is very important otherwise will causing server confusion







