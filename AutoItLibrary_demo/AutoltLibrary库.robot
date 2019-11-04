*** Settings ***
Library           SeleniumLibrary
Library           AutoItLibrary
Library           os

*** Test Cases ***
Test_calc
    Run    calc.exe
    Wait For Active Window    计算器
    Mouse click    nX=218    nY=706    nSpeed=10    #点击计算器2
    Mouse click    nX=378    nY=594    nSpeed=10    #点击计算器*
    Mouse click    nX=295    nY=705    nSpeed=10    #点击计算器3
    Mouse click    nX=374    nY=705    nSpeed=10    #点击计算器+
    Mouse click    nX=139    nY=650    nSpeed=10    #点击计算器4
    Mouse click    nX=375    nY=758    nSpeed=10    #点击计算器=

Test_Process_Close
    Run    calc.exe
    Wait For Active Window    计算器
    Process Close    Calculator.exe

Test_Login_Just
    Run    C:/TestClient/JustThinking.exe
    Wait For Active Window    登录业务管理系统
    sleep    2
    Send    Admin    #输入用户名
    send    {TAB}    #模拟Tab键
    send    123    #输入密码
    send    {TAB}
    sleep    3
    send    {ENTER}    #模拟回车键

Test_Win_Get_Client
    Run    calc.exe
    Wait For Active Window    计算器
    ${height}    Win Get Client Size Height    计算器
    ${width}    Win Get Client Size Width    计算器
    log many    ${height}    ${width}
    Process Close    Calculator.exe

Test_Win_Get_Title
    Run    calc.exe
    Wait For Active Window    计算器
    Win Set Title    计算器    \    计算机
    ${title}    Win Get Title    计算机
    log    ${title}

Test_文件上传
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/engine/issues/new
    Input Text    id=issue_subject    测试单选按钮
    Input Text    id=issue_description    Select Radio Button 单选按钮
    Press Keys    //*[@id="attachments_form"]/span/span[2]/input    \ue007
    sleep    2
    Run    D:/TestProject/AutoItLibrary_demo/upfile.exe
    sleep    2
    Click Element    name=commit

Test_文件下载
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/issues/307
    Click element    //*[@id="content"]/div[2]/div[5]/table/tbody/tr/td[2]/a[2]
    sleep    2
    Run    D:/TestProject/AutoItLibrary_demo/downfile.exe

Test_Just_检查录入
    Run    C:/TestClient/JustThinking.exe
    Wait For Active Window    登录业务管理系统
    sleep    2
    Send    Admin    #输入用户名
    send    {TAB}    #模拟Tab键
    send    123    #输入密码
    send    {TAB}
    sleep    3
    send    {ENTER}    #模拟回车键
    Wait For Active Window    加拾金服
    MouseClick    nX=54    nY=195    nClicks=2
