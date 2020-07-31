*** Settings ***
Resource    keyws-vars-libs-TRNU-G4.robot

*** Test Cases ***
สั่งซื้อ Hoppity Ball 26 inch 1 ea ด้วย GSB Debit
    #สั่งซื้อของเล่น    ${TOY_NAME}    ${QUANTITY}    ${PAYMENT_ELEMENT}    ${SHIPPING_METHOD}
    สั่งซื้อของเล่น Hoppity Ball 26 inch 1 ชิ้น จ่ายเงินโดย GSB ส่งแบบ EMS
