*** Settings ***
Library           DatabaseLibrary

*** Test Cases ***
Mysql_test
    Connect To DatabaseUsing Custom Params    pymysql    database='img', user='root', password='123456', host='10.0.7.60', port=3306
    Comment    Execute Sql String    SELECT * FROM `t_crawl_wangcha_base` WHERE loanguid = '123456789123456789123456789123456789'
    @{queryResults}    Query    SELECT * FROM `t_crawl_wangcha_base` WHERE loanguid = '123456789123456789123456789123456789'
    Log Many    @{queryResults}
    Disconnect From Database

Mysql_test2
    Connect To DatabaseUsing Custom Params    pymysql    database='img', user='root', password='123456', host='10.0.7.60', port=3306
    Execute Sql Script    D:\\TestProject\\AutoItLibrary_demo\\sqlScriptFile.sql
    @{queryResults}    Query    SELECT * FROM `t_crawl_wangcha_base` WHERE loanguid = '123456'
    Log Many    @{queryResults}
    Disconnect From Database
