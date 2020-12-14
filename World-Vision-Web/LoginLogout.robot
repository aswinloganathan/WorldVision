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

*** Test Cases ***
Login and Logout
    Open Worldvision
    Wait Until Element Is Visible   xpath=//android.view.View[contains(@text,'Skip')]    20s
    Click Element        xpath=//android.view.View[contains(@text,'Skip')]
    
    Wait Until Element Is Visible    xpath=(//*[@class='android.widget.EditText'])[1]    20s
    Input Text    xpath=(//*[@class='android.widget.EditText'])[1]    ${USERNAME}
    Input Password    xpath=(//*[@class='android.widget.EditText'])[2]    ${PASSWORD}
    Click Element    xpath=//android.widget.Button[contains(@text,'LOGIN')]
    
    Sleep    20s
    Swipe    0    1026    800    1026  
    Wait Until Page Contains Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Logout')]    25s
    Click Element    //android.view.View//android.view.View[2]//android.widget.Button[contains(@text,'Logout')]
    
    Sleep    10s    
    Close Application  