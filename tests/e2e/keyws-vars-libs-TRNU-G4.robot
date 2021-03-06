*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#${URL}    https://capmu.github.io/TRNU-G4-ROBOT-TEST/
${URL}    http://localhost:4200/
${TOY_NAME}    Hoppity Ball 26 inch
${TOY_ID}    4
${QUANTITY}    1  
${BRAND}    SportsFun
${SELECT_GENDER}    neutral
${GENDER}    Neutral
${AGE}    3_to_5
${PRICE}    $29.95
${SUB_TOTAL}    $29.95
${SHIPPING_FEE}    ฿30.00
${TOTAL_PRICE}    ฿974.32
${SHIPPING_METHOD}    EMS                       
${PAYMENT_ELEMENT}    option_gsb
#${SLIP_ID}    20200730007

*** Keywords ***
#-----------------------------------------------------------------------------
# Main process.
#-----------------------------------------------------------------------------
สั่งซื้อของเล่น Hoppity Ball 26 inch 1 ชิ้น จ่ายเงินโดย GSB ส่งแบบ EMS
    เลือกของเล่นที่เว็บ TOY_R_NOT_US
    ตรวจสอบรายละเอียดสินค้า และเลือกซื้อ 1 ชิ้น
    ตรวจสอบรายละเอียดสินค้าทั้งรถเข็น และกดปุ่ม Process to checkout
    เลือกช่องทางการชำระเงิน แล้วกดชำระเงิน
    ตรวจสอบหน้าสุดท้าย และปิด Browser
#-----------------------------------------------------------------------------
# Search page.
#-----------------------------------------------------------------------------
เปิดเว็บ TOY_R_NOT_US ด้วย chrome
    Open Browser    ${URL}    chrome
    #for developing phase only--------------------------
    Click Element    id=testing_search_page
    #---------------------------------------------------
    Wait Until Page Contains Element    id=select_age
    Wait Until Page Contains Element    id=select_gender
    Wait Until Page Contains Element    id=button_search
เลือกอายุ
    Click Element    id=select_age
    Click Element    id=${AGE}
เลือกเพศ
    Click Element    id=select_gender
    Click Element    id=${SELECT_GENDER}
กดค้นหา
    Click Element    id=button_search
กดเลือกของเล่น
    [Arguments]    ${TOY_ID}
    Wait Until Page Contains Element    ${TOY_ID}
    Click Element    ${TOY_ID}
#-----------------------------------------------------------------------------
เลือกของเล่นที่เว็บ TOY_R_NOT_US
    เปิดเว็บ TOY_R_NOT_US ด้วย chrome
    เลือกอายุ
    เลือกเพศ
    กดค้นหา
    กดเลือกของเล่น    ${TOY_ID}
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
ตรวจสอบ Price : 29.95
    Wait Until Element Contains    id=price    ${PRICE}
ตรวจสอบ Status : In Stock / Out of stock
    Wait Until Element Contains    id=status    In Stock
เลือกจำนวนของเล่น
    [Arguments]    ${QUANTITY}
    Input Text    select_quantity    ${QUANTITY}
กด Add to cart
    Click Element    id=button_add_to_cart
#-----------------------------------------------------------------------------
ตรวจสอบรายละเอียดสินค้า และเลือกซื้อ 1 ชิ้น
    ตรวจสอบ Toy Image : Hoppity Ball 26 inch
    ตรวจสอบ Toy name : Hoppity Ball 26 inch
    ตรวจสอบ Brand : SportsFun
    ตรวจสอบ Gender : Neutral
    ตรวจสอบ Age : 3_to_5
    ตรวจสอบ Price : 29.95
    ตรวจสอบ Status : In Stock / Out of stock
    เลือกจำนวนของเล่น    ${QUANTITY}
    กด Add to cart
#-----------------------------------------------------------------------------
# Shopping Cart page.
#-----------------------------------------------------------------------------
ตรวจสอบ Toy name : Hoppity Ball 26 inch ในหน้า Shopping Cart
    Wait Until Element Contains    id=product_name    ${TOY_NAME}
ตรวจสอบ Brand : SportsFun ในหน้า Shopping Cart
    Wait Until Element Contains    id=brand    ${BRAND}
ตรวจสอบ Gender : Neutral ในหน้า Shopping Cart
    Wait Until Element Contains    id=gender    ${GENDER}
ตรวจสอบ Age : 3_to_5 ในหน้า Shopping Cart
    Wait Until Element Contains    id=age    ${AGE}
ตรวจสอบ Price : 29.95 ในหน้า Shopping Cart
    Wait Until Element Contains    id=price    ${PRICE}
ตรวจสอบ Status : In Stock / Out of stock ในหน้า Shopping Cart
    Wait Until Element Contains    id=status    In Stock
เลือกวิธีจัดส่ง - EMS
    Click Element    id=radio_ems
ตรวจสอบว่าราคา subtotal ถูกต้อง และเลือกการจัดส่งที่ถูกต้อง
    Wait Until Element Contains    id=sub_total    ${SUB_TOTAL}
    Wait Until Element Contains    id=shipping_method    ${SHIPPING_METHOD}
    Wait Until Element Contains    id=shipping_fee    ${SHIPPING_METHOD}
กด Process to checkout
    Click Element    id=button_checkout
#-----------------------------------------------------------------------------
ตรวจสอบรายละเอียดสินค้าทั้งรถเข็น และกดปุ่ม Process to checkout
    ตรวจสอบ Toy Image : Hoppity Ball 26 inch ในหน้า Shopping Cart
    ตรวจสอบ Toy name : Hoppity Ball 26 inch ในหน้า Shopping Cart
    ตรวจสอบ Brand : SportsFun ในหน้า Shopping Cart
    ตรวจสอบ Gender : Neutral ในหน้า Shopping Cart
    ตรวจสอบ Age : 3_to_5 ในหน้า Shopping Cart
    ตรวจสอบ Price : 29.95 ในหน้า Shopping Cart ในหน้า Shopping Cart
    ตรวจสอบ Status : In Stock / Out of stock
    เลือกวิธีจัดส่ง - EMS
    กด Process to checkout
#-----------------------------------------------------------------------------
# Address/Shipping page.
#-----------------------------------------------------------------------------
พิมพ์ชื่อที่อยู่ 1
    Input Text    id=input_address1    179 ซอย รัชดาภิเษก 36 จันทรเกษม
พิมพ์ชื่อที่อยู่ 2
    Input Text    id=input_address2    -
พิมพ์ชื่อ City
    Input Text    id=input_city    จตุจักร
พิมพ์ชื่อ Province
    Input Text    id=input_province    กรุงเทพ
พิมพ์รหัสไปรษณีย์
    Input Text    id=input_postcode    10900
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
    #Wait Until Element Contains    id=slip_id    ${SLIP_ID}
ตรวจสอบชื่อและนามสกุล
    Wait Until Element Contains    id=customer_name    อัครเดช สิริวัฒน์
ตรวจสอบTotal Price
    Wait Until Element Contains    id=total_price    ${TOTAL_PRICE}
ตรวจสอบ Shipping type
    Wait Until Page Contains Element    id=shipping_type
ตรวจสอบ Location: ที่อยู่ 1
    Wait Until Element Contains    id=input_address1    179 ซอย รัชดาภิเษก 36 จันทรเกษม
ตรวจสอบ Location: ที่อยู่ 2
    Wait Until Element Contains    id=input_address2    -
ตรวจสอบ Location: City
    Wait Until Element Contains    id=input_city    จตุจักร
ตรวจสอบ Location: Province
    Wait Until Element Contains    id=input_province    กรุงเทพ
ตรวจสอบ Location: รหัสไปรษณีย์
    Wait Until Element Contains    id=input_postcode    10900
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
