*** Settings *** 
#Test Setup    Open Worldvision
Test Teardown    Open Worldvision
Library           AppiumLibrary
   

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    10.0
${DEVICE_NAME}    emulator-5554
#${APPLICATION}    D:\TestLeaf\Maven\World-Vision-Web\app\app-debug.apk    
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
Login to capture username and password alert
    
    Open Worldvision
    
    Wait Until Element Is Visible   xpath=//android.view.View[contains(@text,'Skip')]    20s
    Click Element        xpath=//android.view.View[contains(@text,'Skip')]
    
    Wait Until Element Is Visible    xpath=(//*[@class='android.widget.EditText'])[1]    20s
    Click Element    xpath=(//*[@class='android.widget.EditText'])[1]
    
    Click Element    xpath=//android.widget.Button[contains(@text,'LOGIN')]
    
    Wait Until Page Contains Element    xpath=//android.view.View[contains(@text,'Username is required!')]    15s
    ${USER_ERROR}    Get Text    xpath=//android.view.View[contains(@text,'Username is required!')]
    Log To Console    ${USER_ERROR} 
    
    Input Text    xpath=(//*[@class='android.widget.EditText'])[1]    ${USERNAME}
    Input Password    xpath=(//*[@class='android.widget.EditText'])[2]    ${PASSWORD}
    Clear Text    xpath=(//*[@class='android.widget.EditText'])[2]    
    Click Element    xpath=(//*[@class='android.widget.EditText'])[2]    
    
    Click Element    xpath=//android.widget.Button[contains(@text,'LOGIN')]      

    Wait Until Page Contains Element    xpath=//android.view.View[contains(@text,'Password is required!')]    15s
    ${PASS_ERROR}    Get Text    xpath=//android.view.View[contains(@text,'Password is required!')]
    Log To Console    ${PASS_ERROR}
    
    #Click Element    //android.widget.Image[contains(@text,'eye')] 
    
    #Element Should Be Disabled    xpath=//android.widget.Button[contains(@text,'LOGIN')], loglevel=INFO

    Sleep    15s    
    Close Application