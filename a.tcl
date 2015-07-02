# This is to set up rules 
test::def description "this is to set up a model creating alarting when triggered"

namespace eval local {
}

##################################################################################
# Main test procedure
##################################################################################
proc test::procedure { } {
    # test::def onu [db::query AssetLists Tickers Tickers GLD]
    # puts $test::info(onu)

set AssetSymbol [db::query_column AssetPriceData2 Asset_Symbol -distinct]
puts "AssetSymbol is $AssetSymbol\n"
foreach j $AssetSymbol {

# set PercentHigh [db::query_column AssetPriceData2 Percent_Change_From_Year_High  -distinct]
set PercentYearHigh [db::query AssetPriceData2 Percent_Change_From_Year_High  Asset_Symbol $j]
puts "PercentYearHigh is $PercentYearHigh\n"
foreach i $PercentYearHigh {
  if { [expr $i >= -1] } {
# exec smail
# common::email_test_crash -subject "Test script cleanup CRASHED"
# report::send_email_report
# exec  echo "pay attention now $j" | mail -s subject jyan0207@gmail.com
puts "something pay attention.\n"
		}
	}
}
}
