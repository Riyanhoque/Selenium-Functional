*** Settings ***
Documentation    Go to the Child link to visit another website 
Library    SeleniumLibrary
Library    Collections
Resource    resource.robot
Test Setup  open the browser with the Mortagage payment url
Library     XML
Library     String


*** Test Cases ***
Validate Child window functionality
    Select the Link of the child window
    Varify the user is switched to child window
    Grab the email address from the childwindow
    switch to parent window and enter the email  



*** Keywords ***
    
Select the Link of the child window
    Click Link   css:.blinkingText
    Sleep    5


Varify the user is switched to child window
    Switch Window        NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the email address from the childwindow
    ${text}=    Get Text    css:.red   
    @{words}=    Split String    ${text}    at
    ${text2}=    Get From List    ${words}    1
    @{words2}=    Split String    ${text2}  
    ${email}=    Get From List    ${words2}    0 
    Log    ${email}
    Set Global Variable    ${email} 

switch to parent window and enter the email
    Switch Window        MAIN
    Input Text    id:username    ${email}
    Sleep    5
