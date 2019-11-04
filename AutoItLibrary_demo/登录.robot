*** Settings ***
Suite Setup
Suite Teardown    测试失败时调用
Test Teardown
Resource          mykeywork.txt
Resource          flow.txt
Library           SeleniumLibrary
Resource          Data_driven-Template.txt

*** Test Cases ***
Test_login_01
    最大化浏览器
    输入用户名    test    #传入用户名
    输入密码    11111111    #传入密码
    点击登录
    检查登录成功

Test_login_02
    登录流程    test    11111111
    检查登录成功
    close browser

Test_login_03
    登录流程    test    abc12345
    检查登录失败
    close browser

Test_login_04
    登录流程    test    11111111a
    登录检查    Fail
    close browser

login_Template
    [Template]    登录测试
    test    11111111    Pass
    test    abc123    Fail
