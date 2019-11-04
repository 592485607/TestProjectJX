*** Test Cases ***
log关键字
    log    hello world!

log_many关键字
    log many    a=1    b=2    c=3

set_variable关键字
    ${var}    Set Variable    'hello'
    ${var2}    Set Variable If    ${var}!='variable'    9
    log    ${var2}

catenate关键字
    ${var}    catenate    SEPARATOR= |     python    and    java
    log    ${var}

create_list关键字
    @{list_str}    create list    python    RF    java    c
    log many    @{list_str}

get_time关键字
    ${str_time}    get time
    log    ${str_time}

sleep关键字
    ${str_time}    get time
    sleep    3
    ${str_time}    get time

if分支判断
    ${str}    Set variable    80
    Run Keyword If    ${str}>=90    log    优
    ...    ELSE IF    ${str}>=80    log    良
    ...    ELSE IF    ${str}>=70    log    中
    ...    ELSE IF    ${str}>=60    log    及格
    ...    ELSE    log    不及格

for_range关键字
    :FOR    ${i}    IN RANGE    5
    \    LOG    ${i}

for_range循环2
    @{list_str}    create list    python    RF    java    c
    :FOR    ${i}    IN    @{list_str}
    \    LOG    ${i}

for_if结合
    @{list_str}    create list    python    RF    java    c
    :FOR    ${i}    IN    @{list_str}
    \    Exit For Loop If    '${i}'=='RF'
    log    ${i}

Evaluate关键字
    ${str}    Evaluate    random.randint(1,9999)    random
    log    ${str}

Evaluate2
    Evaluate    os.system('python D:/TestProject/web_demo_01/random_test.py')    os
