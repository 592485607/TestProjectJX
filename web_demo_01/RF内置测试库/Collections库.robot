*** Settings ***
Library           Collections
Library           SeleniumLibrary

*** Test Cases ***
字典操作
    ${dict}    Create Dictionary    Dev1=python \     Dev2=java    Dev3=go    Dev4=RF    #定义字典
    ${items}    Get Dictionary Items    ${dict}    #获取字典中的 key 和 value
    log    ${items}
    ${keys}    Get Dictionary Keys    ${dict}    #获取字典中的 key
    log    ${keys}
    ${values}    Get Dictionary Values    ${dict}    #获取字典中的value
    log    ${values}
    ${i}    Get From Dictionary    ${dict}    Dev4    #获取字典中的 key 对应的 value
    log    ${i}
