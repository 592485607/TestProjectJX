*** Settings ***
Library           SeleniumLibrary

*** Variables ***

*** Test Cases ***
case01
    open Browser    http://www.baidu.com

case02
    Log    hello world

引用scalar变量
    open browser    ${url}

test_list变量
    [Tags]    V1.0
    : FOR    ${i}    IN    @{username}
    \    log    ${i}

*** Keywords ***
