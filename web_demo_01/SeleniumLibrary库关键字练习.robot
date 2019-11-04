*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
test01

test_case_循环关键字
    循环    3

*** Keywords ***
循环
    [Arguments]    ${num}
    :FOR    ${i}    IN RANGE    ${num}
    \    log    ${i}
