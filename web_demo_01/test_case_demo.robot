*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
baidu
    Open Browser    http://www.baidu.com    edge
    Input text    id=kw    python
    click button    id=su
    reload page
    sleep    2
    close window

test_click image
    Open Browser    https://www.baidu.com/    edge
    Input text    id=kw    图片
    click button    id=su
    click image    到百度首页

test_click_link
    open browser    http://10.0.81.100/redmine
    click element    link=登录

Test_Mouse_Over
    Open Browser    https://www.baidu.com    ff
    Maximize Browser Window
    sleep    2
    Mouse Over    xpath=/html/body/div[1]/div[1]/div/div[3]/a[8]
    click element    xpath=/html/body/div[1]/div[6]/a[2]

Test_Drag_And_Drop
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    sleep    2
    go to    http://10.0.81.100/redmine/projects/just-test/settings/boards
    Drag and drop    //span[@class='sort-handle ui-sortable-handle' and @data-reorder-url="/redmine/projects/just-test/boards/6"]    //span[@class='sort-handle ui-sortable-handle' and @data-reorder-url="/redmine/projects/just-test/boards/5"]

Test_DragAndDropByOffset
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    sleep    2
    go to    http://10.0.81.100/redmine/projects/just-test/settings/boards
    Drag and drop By Offset    //span[@class='sort-handle ui-sortable-handle' and @data-reorder-url="/redmine/projects/just-test/boards/6"]    0    -20

Test_press_key
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    sleep    2
    Press Key    id=q    缺陷
    Press Keys    id=q    \ue007

Test_press_key_特殊编码
    Open Browser    https://www.baidu.com    edge
    Input text    id=kw    python
    Press key    id=su    \ue007

Test_clear_element_text
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    sleep    2
    clear element text    id=password

Test_Select_Radio_Button
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/engine/issues/new
    Input Text    id=issue_subject    测试单选按钮
    Input Text    id=issue_description    Select Radio Button 单选按钮
    Select Radio Button    issue[custom_field_values][24]    1

Test_Select_checkbox
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/engine/issues/new
    Input Text    id=issue_subject    测试复选框按钮
    Input Text    id=issue_description    Select checkbox和Unselect checkbox 模拟复选框操作
    Select checkbox    //input[@name="issue[custom_field_values][22][]" and @value="需求"]
    Select checkbox    //input[@name="issue[custom_field_values][22][]" and @value="设计"]
    Select checkbox    //input[@name="issue[custom_field_values][22][]" and @value="代码"]
    Unselect checkbox    //input[@name="issue[custom_field_values][22][]" and @value="需求"]

Test_select_from_list
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/engine/issues/new
    Input Text    id=issue_subject    测试下拉列表
    Input Text    id=issue_description    Select From List 模拟选择下拉列表值
    Select From List    id=issue_priority_id    高    #通过label选择
    sleep    5
    Select From List    id=issue_priority_id    4    #通过value选择

Test_Select_All_From_List
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/engine/issues/new
    Input Text    id=issue_subject    测试全选下拉列表
    Input Text    id=issue_description    Select All From List 模拟全选下拉列表
    Select All From List    issue_custom_field_values_22

Test_Select_From_List_By_Index
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/engine/issues/new
    Input Text    id=issue_subject    通过index选择下拉列表
    Input Text    id=issue_description    Select From List By Index 模拟选择下拉列表
    Select From List By Index    id=issue_custom_field_values_6    1    #index下标从0开始，此处1为致命

Test_Submit_Form
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/engine/issues/new
    Input Text    id=issue_subject    创建缺陷
    Input Text    id=issue_description    创建表单缺陷
    Submit Form    id=issue-form

Test_Wait_for_Condition
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    go to    http://10.0.81.100/redmine/projects/engine/issues/new
    Wait For Condition    return document.getElementById("issue_subject").id=="issue_subject"    2    未找到
    Input Text    id=issue_subject    创建缺陷

Test_Get_Title
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    ${title}=    Get Title
    log    ${title}
    Should Contain    ${title}    加拾金服项目管理系统

Test_Get Location
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    ${title}=    Get Location
    log    ${title}
    Should Contain    ${title}    http://10.0.81.100/redmine/login

Test_Get_Element_Attribute
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    ${attribute}    Get Element Attribute    //*[@id="username"]    tabindex
    log    ${attribute}

Test_Get_Source
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    ${source_html}    Get Source
    log    ${source_html}

Test_Get_Value
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    ${value}    Get Value    id=login-submit
    log    ${value}

Test_Get_Text
    Open Browser    http://10.0.81.100/redmine/login    ff
    Maximize Browser Window
    Input Text    id=username    test
    Input Text    id=password    11111111
    click element    //*[@id="login-submit"]
    ${value}    Get Text    /html/body/div/div[2]/div[1]/div[3]/div[2]/h2
    log    ${value}
