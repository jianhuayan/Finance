# Copyright 2014 Aurora Networks 
# test::def name "test_MPF-09"
test::def title "MPF-09 PBB Data Test"
test::def description "CableLabs test case MPF-09. PBB Transport Mode - I-SID Based Classification."
# test::def requires {olt ixia}
# test::def olt {10.120.12.3}

namespace eval Price_daily_update_combined {
# variable URL_base_1 "http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,"
}

##################################################################################
# Main test procedure
##################################################################################
proc test::procedure { } {
    set URL_base_1 "http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,"
    # test::def onu [db::query CL_ONUs primary_ONU OLT $test::info(olt)]
    # test::def onu [db::query AssetLists Tickers Tickers GLD]
    # puts $test::info(onu)
set col_list {`Tickers`,`Description`,`longshort`,`AssetClass`}
set val_list {'COW',2,1,3}

    set x [db::query_column AssetLists Tickers]
    # set x [db::insert AssetPriceData $col_list $val_list]
    # set x [db::insert AssetLists $col_list $val_list]
set y [lindex $x 0]
for {set i 1} {$i <= [llength $x]} {incr i} {
append y "," [lindex $x $i]
}
# exec wget -O Price1.csv "http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,$y&f=nsl1opm7m5k4j5&e=.csv"
exec wget -O /home/jyan/Finance/sandbox/Price.csv "$URL_base_1$y&f=nsd1j1v0w0l1opm8m6k5j6&e=.csv"
}
