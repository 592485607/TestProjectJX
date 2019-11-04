*** Settings ***
Library           SeleniumLibrary
Library           Screenshot

*** Test Cases ***
id与name
    open browser    http://10.0.81.100/redmine/login
    Input Text    id=username    test    #使用ID定位输入用户名
    Input Text    name=username    test    #使用name定位输入用户名

link定位
    open browser    http://10.0.81.100/redmine
    click element    link=登录

xpath绝对路径定位
    open browser    http://10.0.81.100/redmine/login
    Input Text    xpath=/html/body/div[@id='wrapper']/div[@id='wrapper2']/div[@id='wrapper3']/div[@id='main']/div[@id='content']/div[@id='login-form']/form/input[@id='username']    test

xpath相对路径定位
    open browser    http://10.0.81.100/redmine/login
    Input Text    //input[@id="username" or @name="username"]    test

css定位
    open browser    http://10.0.81.100/redmine/login
    Input Text    css=#username    test
