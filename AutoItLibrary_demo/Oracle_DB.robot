*** Settings ***
Library           DatabaseLibrary

*** Test Cases ***
oracle_test1
    Connect To DatabaseUsing Custom Params     cx_Oracle    'jxjr_cms','123456','10.0.8.8:1521/JXTEST'
    Execute Sql String    select * from t_appjhmwealthcode where guid='7AEA732B-F9EC-4AB0-9183-B15028E880CE'
    Disconnect From Database

oracle_test2
    Connect To DatabaseUsing Custom Params     cx_Oracle    'jxjr_cms','123456','10.0.8.8:1521/JXTEST'
    @{res}    query    select * from t_appjhmwealthcode where guid='7AEA732B-F9EC-4AB0-9183-B15028E880CE'
    log many    @{res}
    Disconnect From Database
