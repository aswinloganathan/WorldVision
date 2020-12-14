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
${USERNAME}    DummyUserTest
${PASSWORD}    DummyPassTest

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
Login using unknown user
    Open Worldvision
    Wait Until Element Is Visible   xpath=//android.view.View[contains(@text,'Skip')]    20s
    Click Element        xpath=//android.view.View[contains(@text,'Skip')]
    
    Wait Until Element Is Visible    xpath=(//*[@class='android.widget.EditText'])[1]    20s
    Input Text    xpath=(//*[@class='android.widget.EditText'])[1]    ${USERNAME}
    Input Password    xpath=(//*[@class='android.widget.EditText'])[2]    ${PASSWORD}
    Click Element    xpath=//android.widget.Button[contains(@text,'LOGIN')]
    
    Wait Until Page Contains Element    xpath=//android.view.View[contains(@text,'Invalid Credentials')]    
    ${LOGINERROR}    Get Text    xpath=//android.view.View[contains(@text,'Invalid Credentials')]
    Log To Console    ${LOGINERROR}    
    
    Sleep    10s    
    Close Application  