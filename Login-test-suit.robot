***Settings***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

***Variables***
${URL}              https://www.saucedemo.com/
${username}         standard_user
${password}         secret_sauce
${firstname}        Kommet
${lastname}         Khongmuang
${postal-code}      10270


***Keywords***
Open chrome
    Open browser    ${URL}             browser=chrome
Open firefox
    Open browser    ${URL}             browser=firefox
Login using valid username & password
    Input text      id=user-name       ${username}
    Input text      name=password      ${password}
    click element   id=login-button
    
Pick goods
    click element       id=add-to-cart-sauce-labs-backpack
    click element       id=shopping_cart_container
    click element       id=checkout

***Test Cases***
LP-01 ตรวจสอบฟังชั่น login กรณีใช้ข้อมูลที่ถูกต้อง
    Open chrome
    Login using valid username & password
    # Capture page Screenshot     valid.png

LP-02 ตรวจสอบฟังชั่น login กรณีไม่กรอก username
    Open chrome
    Input text      name=password       ${password}
    click element   id=login-button
    # Capture page Screenshot     blank-user.png

LP-03 ตรวจสอบฟังชั่น login กรณีกรอก username ที่ไม่ตรงกับข้อมูลที่มีในระบบ
    Open chrome
    Input text      id=user-name        wrongusername
    Input text      name=password       ${password}
    click element   id=login-button
    # Capture page Screenshot     not-exist-user.png

LP-04 ตรวจสอบฟังชั่น login กรณีกรอก username น้อยกว่าจำนวนขั้นต่ำระบบรองรับจำนวน 5-20 ตัวอักษร
    Open chrome
    Input text      id=user-name        shrt
    Input text      name=password       ${password}
    click element   id=login-button
    # Capture page Screenshot     too-short-user.png

LP-05 ตรวจสอบฟังชั่น login กรณีไม่กรอก password
    Open chrome
    Input text      id=user-name        ${username}
    click element   id=login-button
    # Capture page Screenshot     blank-pass.png

LP-06 ตรวจสอบฟังชั่น login กรณีกรอก password ไม่ถูกต้อง
    Open chrome
    Input text      id=user-name        ${username}
    Input text      name=password       wrongpassword
    click element   id=login-button
    # Capture page Screenshot     invalid-pass.png

LP-07 ตรวจสอบฟังชั่น login กรณีกรอก password น้อยกว่าจำนวนขั้นต่ำระบบรองรับจำนวน 6-20 ตัวอักษร
    Open chrome
    Input text      id=user-name        ${username}
    Input text      name=password       shrt
    click element   id=login-button
    # Capture page Screenshot     too-short-pass.png