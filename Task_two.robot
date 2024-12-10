*** Settings ***
Library           SeleniumLibrary

*** Variables ***
&{INVALID_LOGIN}    Username=prince-espiot    Password=mypassword
${BROWSER}        chrome
${URL}            https://www.saucedemo.com/
&{VALID_LOGIN}    Username=standard_user    Password=secret_sauce

*** Test Cases ***
Login with valid details
    [Documentation]    This is to verify that the user can login using the correct login details.
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=user-name    ${VALID_LOGIN["Username"]}
    Input Password    id=password    ${VALID_LOGIN["Password"]}
    Click Button    id=login-button
    Sleep    1s
    Close Browser
    Log To Console    Test Ran was successful

Login with INVALID details
    [Documentation]    This is to verify that the user can login using the incorrect login details.
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=user-name    ${INVALID_LOGIN["Username"]}
    Input Password    id=password    ${INVALID_LOGIN["Password"]}
    Click Button    id=login-button
    Sleep    1s
    Close Browser
    Log To Console    Test Ran was successful

Dashboard Responsiveness
    [Documentation]    This test case is to verify that the dashboard loads properly
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=user-name    ${VALID_LOGIN["Username"]}
    Input Password    id=password    ${VALID_LOGIN["Password"]}
    Click Button    id=login-button
    Wait Until Element Is Visible    css:div.app_logo    2s
    Page Should Contain    Swag Labs
    Close Browser
    Log To Console    Test Ran was successful
Ensuring application handles the user input correctly
    [Documentation]    Error handling
    Open Browser    ${URL}    ${BROWSER}
    Click Button    id=login-button
    Page Should Contain    Username is required
    Close Browser
    Log To Console    Test Ran was successful