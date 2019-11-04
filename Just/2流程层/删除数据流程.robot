*** Settings ***
Resource          ../3页面层/数据库操作.txt

*** Keywords ***
清空数据
    [Arguments]    ${phone}
    删除数据初始化    ${phone}
