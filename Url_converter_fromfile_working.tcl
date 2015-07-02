#! /usr/bin/tclsh

proc Url_Converter {Url_rtn_original} {
# set Url_rtn_original {"SPDR Gold Trust","GLD","5/29/2015",N/A,N/A,N/A,114.10,114.14,114.02,-0.74%,-1.48%,-11.69%,+4.04%}
set Url_rtn_original $Url_rtn_original 
set property_list [split $Url_rtn_original ","]
puts "property_list:$property_list\n"
set l0a  [lindex $property_list 0] 
set l0  [regsub -all {"} $l0a {'}]
puts "l0 is $l0\n" 
set l1a  [lindex $property_list 1] 
set l1  [regsub -all {"} $l1a {'}]
puts "l1 is $l1\n" 
set l2z  [lindex $property_list 2] 
set l2a [regsub -all {"} $l2z {}]
set l2b [split $l2a "/"]
# puts "l2b is $l2b\n"
# set l2c [join [list $x $y $z] "-"]
set l2c [join [list [lindex $l2b 2] [lindex $l2b 0] [lindex $l2b 1]] "-"]
set l2x "\'"
# puts "l2x is $l2x\n"
set l2y "\'"
set l2 [join [list $l2x $l2y] "$l2c"]
puts "l2 : $l2.\n"
set l3a  [lindex $property_list 3] 
set l3x "\'"
set l3y "\'"
set l3 [join [list $l3x $l3y] "$l3a"]
puts "l3 is $l3.\n"
set l4a  [lindex $property_list 4] 
set l4x "\'"
set l4y "\'"
set l4 [join [list $l4x $l4y] "$l4a"]
puts "14 is $l4"
set l5a  [lindex $property_list 5] 
set l5x "\'"
set l5y "\'"
set l5 [join [list $l5x $l5y] "$l5a"]
puts "15 is $l5"
set l6  [lindex $property_list 6] 
puts "l6 is $l6.\n"
set l7  [lindex $property_list 7] 
puts "l7 is $l7.\n"
set l8  [lindex $property_list 8] 
puts "l8 is $l8.\n"
set l9a  [lindex $property_list 9] 
set l9 [regsub -all {\%} $l9a {}]
puts "l9 is $l9.\n"
set l10a  [lindex $property_list 10] 
set l10 [regsub -all {\%} $l10a {}]
puts "l10 is $l10.\n"
set l11a  [lindex $property_list 11] 
set l11 [regsub -all {\%} $l11a {}]
puts "l11 is $l11.\n"
set l12a  [lindex $property_list 12] 
set l12 [regsub -all {\%} $l12a {}]
puts "l12 is $l12.\n"
set Url_rtn_converted [join [list $l0 $l1 $l2 $l3 $l4 $l5 $l6 $l7 $l8 $l9 $l10 $l11 $l12] ","]
puts "Url_rtn_converted is $Url_rtn_converted\n"
} 

set filename ~jyan/ATE/Price.csv 
# test::log "locate the downloaded YAHOO fiance data ${filename} ..."
# Convert the decimal vlan to hex.
# Open the input config file for reading:
set InFileName $filename
set InFileId [open $InFileName r]
# set lineNumber 0
# foreach line $InFileId {
# puts "line is $line.\n"
# Url_Converter $line
# }
while { [gets $InFileId line] >= 0} {
puts "line is $line\n"
Url_Converter $line
}
# Close the input file
close $InFileId

