*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4200/
${TOY_NAME}    Hoppity Ball 26 inch
${TOY_ID}    4
${QUANTITY}    1
${BRAND}    SportsFun
${GENDER}    Neutral
${AGE}    3_to_5
${PRICE}    29.95 (USD)
${SHIPPING_FEE}    30.00 (THB)
${TOTAL_PRICE}    974.32 (THB)
${SHIPPING_METHOD}    EMS
${PAYMENT_ELEMENT}    option_gsb
${SLIP_ID}    20200730007

*** Test Cases ***
สั่งซื้อ Hoppity Ball 26 inch 1 ea ด้วย GSB Debit
    #สั่งซื้อของเล่น    ${TOY_NAME}    ${QUANTITY}    ${PAYMENT_ELEMENT}    ${SHIPPING_METHOD}
    สั่งซื้อของเล่น Hoppity Ball 26 inch 1 ชิ้น จ่ายเงินโดย GSB ส่งแบบ EMS

*** Keywords ***
#-----------------------------------------------------------------------------
# Main process.
#-----------------------------------------------------------------------------
สั่งซื้อของเล่น Hoppity Ball 26 inch 1 ชิ้น จ่ายเงินโดย GSB ส่งแบบ EMS
    เปิดเว็บ Toy R not Us ด้วย chrome และเลือกของเล่น
    ตรวจสอบรายละเอียดสินค้า และเลือกซื้อ 1 ชิ้น
    ตรวจสอบรายละเอียดสินค้าทั้งรถเข็น และกดปุ่ม Process to checkout
    เลือกช่องทางการชำระเงิน แล้วกดชำระเงิน
    ตรวจสอบหน้าสุดท้าย และปิด Browser
#-----------------------------------------------------------------------------
# Search page.
#-----------------------------------------------------------------------------
เปิดเว็บ Toy R not Us ด้วย chrome
    Open Browser    ${URL}    chrome
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
    Click Element    ${TOY_ID}
#-----------------------------------------------------------------------------
เปิดเว็บ Toy R not Us ด้วย chrome และเลือกของเล่น
    เปิดเว็บ Toy R not Us ด้วย chrome
    เลือกอายุ
    เลือกเพศ
    กดค้นหา
    กดเลือกของเล่น    ${TOY_NAME}
#-----------------------------------------------------------------------------
# Product details page.
#-----------------------------------------------------------------------------
ตรวจสอบ Toy Image : Hoppity Ball 26 inch
    Page Should Contain Image    id=product_img
ตรวจสอบ Toy name : Hoppity Ball 26 inch
    Wait Until Element Contains    id=product_name    ${TOY_NAME}
ตรวจสอบ Brand : SportsFun
    Wait Until Element Contains    id=brand    ${BRAND}
ตรวจสอบ Gender : Neutral
    Wait Until Element Contains    id=gender    ${GENDER}
ตรวจสอบ Age : 3_to_5
    Wait Until Element Contains    id=age    ${AGE}
ตรวจสอบ Price : 19.95
    Wait Until Element Contains    id=price    ${PRICE}
ตรวจสอบ Status : In Stock / Out of stock
    Wait Until Element Contains    id=status    In Stock
กด Add to cart
    Click Element    id=button_search
เลือกจำนวนของเล่น
    [Arguments]    ${NUMBER}
    Input Text    select_quantity    ${QUANTITY}
#-----------------------------------------------------------------------------
ตรวจสอบรายละเอียดสินค้า และเลือกซื้อ 1 ชิ้น
    ตรวจสอบ Toy Image : Hoppity Ball 26 inch
    ตรวจสอบ Toy name : Hoppity Ball 26 inch
    ตรวจสอบ Brand : SportsFun
    ตรวจสอบ Gender : Neutral
    ตรวจสอบ Age : 3_to_5
    ตรวจสอบ Price : 19.95
    ตรวจสอบ Status : In Stock / Out of stock
    กด Add to cart
    เลือกจำนวนของเล่น
#-----------------------------------------------------------------------------
# Shopping Cart page.
#-----------------------------------------------------------------------------
ตรวจสอบ Toy Image : Hoppity Ball 26 inch
    Page Should Contain Image    id=product_img
ตรวจสอบ Toy name : Hoppity Ball 26 inch
    Wait Until Element Contains    id=product_name    ${TOY_NAME}
ตรวจสอบ Brand : SportsFun
    Wait Until Element Contains    id=brand    ${BRAND}
ตรวจสอบ Gender : Neutral
    Wait Until Element Contains    id=gender    ${GENDER}
ตรวจสอบ Age : 3_to_5
    Wait Until Element Contains    id=age    ${AGE}
ตรวจสอบ Price : 19.95
    Wait Until Element Contains    id=price    ${PRICE}
ตรวจสอบ Status : In Stock / Out of stock
    Wait Until Element Contains    id=status    In Stock
เลือกวิธีจัดส่ง - EMS
    Wait Until Element Contains    id=shipping_method    ${SHIPPING_METHOD}
กด Process to checkout
    Click Element    id=button_checkout
#-----------------------------------------------------------------------------
ตรวจสอบรายละเอียดสินค้าทั้งรถเข็น และกดปุ่ม Process to checkout
    ตรวจสอบ Toy Image : Hoppity Ball 26 inch
    ตรวจสอบ Toy name : Hoppity Ball 26 inch
    ตรวจสอบ Brand : SportsFun
    ตรวจสอบ Gender : Neutral
    ตรวจสอบ Age : 3_to_5
    ตรวจสอบ Price : 19.95
    ตรวจสอบ Status : In Stock / Out of stock
    เลือกวิธีจัดส่ง - EMS
    กด Process to checkout
#-----------------------------------------------------------------------------
# Address/Shipping page.
#-----------------------------------------------------------------------------
พิมพ์ชื่อที่อยู่ 1
    Input Text    id=input_address1    บ้านเลขที่ 99/99 ซอยหัวหอม ถนนลูกรัง แขวงเสื้อตากไว้ เขตปลอดเชื้อ
พิมพ์ชื่อที่อยู่ 2
    Input Text    id=input_address2    -
พิมพ์ชื่อ City
    Input Text    id=input_city    -
พิมพ์ชื่อ Province
    Input Text    id=input_province    จังหวัดสามช่า
พิมพ์รหัสไปรษณีย์
    Input Text    id=input_postcode    99999
กดปุ่มยืนยัน
    Click Element    id=button_address
#-----------------------------------------------------------------------------
กรอกที่อยู่สำหรับการจัดส่ง
    พิมพ์ชื่อที่อยู่ 1
    พิมพ์ชื่อที่อยู่ 2
    พิมพ์ชื่อ City
    พิมพ์ชื่อ Province
    พิมพ์รหัสไปรษณีย์
    กดปุ่มยืนยัน
#-----------------------------------------------------------------------------
# Payment page.
#-----------------------------------------------------------------------------
เช็คว่าอยู่ในหน้า Payment แล้ว
    Wait Until Page Contains Element    id=button_pay
    Wait Until Page Contains Element    id=option_gsb
เลือกประเภทการชำระเงิน
    [Arguments]    ${PAYMENT_ELEMENT}
    Click Element    id=${PAYMENT_ELEMENT}
กดชำระเงิน
    Click Element    id=button_pay
#-----------------------------------------------------------------------------
เลือกช่องทางการชำระเงิน แล้วกดชำระเงิน
    เช็คว่าอยู่ในหน้า Payment แล้ว
    เลือกประเภทการชำระเงิน
    กดชำระเงิน
#-----------------------------------------------------------------------------
# Thanks you page.
#-----------------------------------------------------------------------------
เช็คว่าอยู่ในหน้า Thanks you แล้ว
    Wait Until Page Contains Element    id=text_success
ตรวจสอบ Slip ID YYYYMMDDSEQ
    Wait Until Page Contains Element    id=slip_id
    Wait Until Element Contains    id=slip_id    ${SLIP_ID}
ตรวจสอบTotal Price
    Wait Until Page Contains Element    id=total_price
    Wait Until Element Contains    id=total_price    ${TOTAL_PRICE}
ตรวจสอบ Shipping type
    Wait Until Page Contains Element    id=shipping_type
ตรวจสอบ Location: ที่อยู่ 1
    Wait Until Element Contains    id=input_address1    บ้านเลขที่ 99/99 ซอยหัวหอม ถนนลูกรัง แขวงเสื้อตากไว้ เขตปลอดเชื้อ
ตรวจสอบ Location: ที่อยู่ 2
    Wait Until Element Contains    id=input_address2    -
ตรวจสอบ Location: City
    Wait Until Element Contains    id=input_city    -
ตรวจสอบ Location: Province
    Wait Until Element Contains    id=input_province    จังหวัดสามช่า
ตรวจสอบ Location: รหัสไปรษณีย์
    Wait Until Element Contains    id=input_postcode    99999
กดปุ่มยืนยัน
    Click Element    id=button_address
ปิด Browser
    Close Browser
#-----------------------------------------------------------------------------
ตรวจสอบ Location
    ตรวจสอบ Location: ที่อยู่ 1
    ตรวจสอบ Location: ที่อยู่ 2
    ตรวจสอบ Location: City
    ตรวจสอบ Location: Province
    ตรวจสอบ Location: รหัสไปรษณีย์

ตรวจสอบหน้าสุดท้าย และปิด Browser
    เช็คว่าอยู่ในหน้า Thanks you แล้ว
    ตรวจสอบ Slip ID YYYYMMDDSEQ
    ตรวจสอบTotal Price
    ตรวจสอบ Shipping type
    ตรวจสอบ Location
    ปิด Browser
#-----------------------------------------------------------------------------
