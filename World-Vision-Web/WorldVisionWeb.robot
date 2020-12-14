*** Settings *** 
#Test Setup    Open Worldvision
Test Teardown    Open Worldvision
Library           AppiumLibrary
   

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    10.0
${DEVICE_NAME}    emulator-5554
${Activity_NAME}    com.wvi.postloginpush.MainActivity
${PACKAGE_NAME}     com.wvi.postloginpush
${USERNAME}    kumaran.xera@yopmail.com
${PASSWORD}    test

*** Keywords ***
Open Worldvision
  Open Application   ${REMOTE_URL}
  ...        platformName=${PLATFORM_NAME}
  ...    platformVersion=${PLATFORM_VERSION}
  ...   deviceName=${DEVICE_NAME}
  ...   automationName=UiAutomator2
    ...    newCommandTimeout=2500
    ...    appActivity=${Activity_NAME}
    ...    appPackage=${PACKAGE_NAME}

Login App
    Wait Until Element Is Visible   xpath=//android.view.View[contains(@text,'Skip')]    20s
    Click Element        xpath=//android.view.View[contains(@text,'Skip')]
    
    Wait Until Element Is Visible    xpath=(//*[@class='android.widget.EditText'])[1]    20s
    Input Text    xpath=(//*[@class='android.widget.EditText'])[1]    ${USERNAME}
    Input Password    xpath=(//*[@class='android.widget.EditText'])[2]    ${PASSWORD}
    Click Element    xpath=//android.widget.Button[contains(@text,'LOGIN')]        
    
Logout
    Sleep    20s
    Swipe    0    1026    800    1026  
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Logout')]    25s
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Logout')]
    Sleep    15s       

Back Arrow Click
    Wait Until Element Is Visible    //android.view.View//android.view.View[1]//android.widget.Button[contains(@text,'arrow back')]    15s
    Click Element    //android.view.View//android.view.View[1]//android.widget.Button[contains(@text,'arrow back')]    

Left Swipe
    Sleep    20s
    Swipe    0    1026    800    1026     
   
*** Test Cases ***
Login Test Case    
    [Documentation]    Test Login Features
    
    Open Worldvision
    Close Application
    
Home Page Left Banner  

    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Home')]    20s
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Home')]
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'My Giving')]    20s
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'My Giving')]
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Tax Receipts')]    20s
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Tax Receipts')] 
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Events')]    20s  
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Events')]
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Jeevan Sparsh')]    20s
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Jeevan Sparsh')]
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'FAQs')]    20s  
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'FAQs')]
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Contact Us')]    20s    
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Contact Us')]
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Share the Joy')]    20s    
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Share the Joy')]       
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[1]//android.widget.Image[contains(@text,'avatar')]    20s
    Click Element    //android.view.View//android.view.View[2]//android.widget.Image[contains(@text,'avatar')]
    Back Arrow Click
    
    Left Swipe
    Wait Until Page Contains Element    //android.widget.Image[@resource-id='close']    20s
    Click Element    //android.widget.Image[@resource-id='close']
    
    Left Swipe
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Logout')]    20s
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Logout')]
    

Header Section Test
    
    Wait Until Element Is Visible    xpath=//android.view.View//android.view.View[1]//android.widget.Button[contains(@text,'cart')]    15s
    Click Element    xpath=//android.view.View//android.view.View[1]//android.widget.Button[contains(@text,'cart')]
    Back Arrow Click
    
    Wait Until Element Is Visible    xpath=//android.view.View//android.view.View[1]//android.widget.Button[contains(@text,'notify')]    15s
    Click Element    xpath=//android.view.View//android.view.View[1]//android.widget.Button[contains(@text,'notify')] 
    
Footer Section Test
    
    Wait Until Element Is Visible    //android.view.View//android.view.View[1]//android.view.View[contains(@text,'My Givings')]   15s
    Click Element    //android.view.View//android.view.View[1]//android.view.View[contains(@text,'My Givings')]
    Back Arrow Click    

    Wait Until Element Is Visible    //android.view.View//android.view.View[1]//android.view.View[contains(@text,'Make Payments')]    20s
    Click Element    //android.view.View//android.view.View[1]//android.view.View[contains(@text,'Make Payments')]
    Back Arrow Click
    
    Wait Until Element Is Visible    //android.view.View//android.view.View[1]//android.view.View[contains(@text,'Tax Receipts')]    15s
    Click Element    //android.view.View//android.view.View[1]//android.view.View[contains(@text,'Tax Receipts')]
    Back Arrow Click                
    
    Wait Until Element Is Visible    //android.view.View//android.view.View[1]//android.view.View[contains(@text,'HOME')]    20s
    Click Element    //android.view.View//android.view.View[1]//android.view.View[contains(@text,'HOME')]    
    