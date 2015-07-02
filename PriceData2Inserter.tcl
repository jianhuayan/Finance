# Copyright 2014 Aurora Networks 
# test::def name "test_MPF-09"
test::def title "MPF-09 PBB Data Test"
test::def description "CableLabs test case MPF-09. PBB Transport Mode - I-SID Based Classification."
# test::def requires {olt ixia}
# test::def olt {10.120.12.3}
# source ~jyan/Finance/sandbox

namespace eval local {
}

##################################################################################
# Main test procedure
##################################################################################
proc test::procedure { } {
    # test::def onu [db::query CL_ONUs primary_ONU OLT $test::info(olt)]
    test::def onu [db::query AssetLists Tickers Tickers GLD]
    puts $test::info(onu)
# set col_list {`Tickers`,`Description`,`longshort`,`AssetClass`}
set col_list {`Asset_Name`,`Asset_Symbol`,`Last_Trade_Date`,`Market_Capitalization`,`Volume`,`Year_Range`,`Latest_Value`,`Open_of_last_trading_day`,`Close_of_last_trading_day`,`Percent_Change_50d_Moving_Average`,`Percent_Change_200d_Moving_Average`,`Percent_Change_From_Year_High`,`Perdent_Change_From_Year_Low`}
# set val_list {'COW',2,1,3}
# set val_list {'Morgan Stanley China A Share Fu','CAF','2015-05-31','N/A','N/A',3,35.15,35.47,35.39,+0.40,+12.49,-5.97,+61.83}
# set val_list {'SPDR Gold Trust','GLD','2015-5-29','N/A','N/A','N/A',114.10,114.14,114.02,-0.74,-1.48,-11.69,+4.04}
set File_converted ~jyan/Finance/sandbox/Price_conv
set File_converted_ID [open $File_converted r]
# set line_data [read $File_converted_ID]
# close $File_converted_ID
# set data [split $line_data "\n"]
while { [gets $File_converted_ID line] >= 0} {
# foreach line $data 
set val_list $line
# set x [db::query_column AssetLists Tickers]
set x [db::insert AssetPriceData2 $col_list $val_list]
# set x [db::insert AssetLists $col_list $val_list]
}
}
