*** Settings ***
Library           MyLibrary/Mytool.py

*** Test Cases ***
2数值比较
    ${res}    Comparative    100    99
    log    ${res}
