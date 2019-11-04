*** Settings ***
Library           SeleniumLibrary
Library           SeleniumLibrary

*** Test Cases ***
login
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    sleep    3
    go to    http://10.0.81.100/redmine/my/account
    sleep    2
    go back

reload_page
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/just-test/settings
    sleep    2
    click element    link=新建版本
    Input Text    css=#version_name    V2019.01.002
    click element    name=commit
    sleep    3
    Reload Page

close_browser
    Open Browser    http://10.0.81.100/redmine/login    ff
    close browser

Close_All_Browsers
    Open Browser    http://10.0.81.100/redmine/login    ff
    Open Browser    http://www.baidu.com    edge
    Close All Browsers

close_window
    Open Browser    http://10.0.81.100/redmine/login    ff
    Open Browser    http://www.baidu.com    edge
    close window
