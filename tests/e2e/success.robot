*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TOY_NAME}    City Gargage Truck Lego
${QUANTITY}    1

*** Test Cases ***
สั่งซื้อ City Gargage Truck Lego 1 ea ด้วย GSB Debit
    เปิดเว็บ Toy R not Us ด้วย chrome และเลือกของเล่น

*** Keywords ***
#-----------------------------------------------------------------------------
# Search page.
#-----------------------------------------------------------------------------
เปิดเว็บ Toy R not Us ด้วย chrome
    Open Browser    http://localhost:4200/    chrome

เลือกอายุ
    Click Element    id=select_age
    Click Element    id=three_to_5

เลือกเพศ
    Click Element    id=select_gender
    Click Element    id=gender_neutral

กดค้นหา
    Click Element    id=button_search

กดเลือกของเล่น
    [Arguments]    ${TOY_NAME}
    Wait Until Page Contains Element    ${TOY_NAME}
    Click Element    id=8
#-----------------------------------------------------------------------------
เปิดเว็บ Toy R not Us ด้วย chrome และเลือกของเล่น
    เปิดเว็บ Toy R not Us ด้วย chrome
    เลือกอายุ
    เลือกเพศ
    กดค้นหา
    กดเลือกของเล่น    ${TOY_NAME}
#-----------------------------------------------------------------------------