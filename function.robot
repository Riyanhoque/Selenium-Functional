*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Setup        open the browser with the Mortagage payment url
Test Teardown        Close Browser
Resource        resource.robot

*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Page}                       css:.nav-link

*** Test Cases ***    
# Validate UnSuccesful Login         
#     Fill the Loging form    ${User_invalid_id}    ${User_invalidpass}
#     wait until Element is located in the page        ${Error_Message_Login}
#     verify error message is correct 

Validate Cards display in the shopping page
    Fill the Loging form    ${User_Valid_id}    ${User_valid_pass}
    wait until Element is located in the page    ${Page}
    Verify card title in the shop page 


*** Keywords ***    
Fill the Loging form
    [Arguments]       ${userId}       ${password}   
    Input Text        id:username    ${userId}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until Element is located in the page
    [Arguments]        ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct    
   Element Text Should Be        ${Error_Message_Login}        Incorrect username/password.

Verify card title in the shop page 
   @{listelements} =    Create List    iphone X  Samsung Note 8  Nokia Edge  Blackberry
   @{LIST} =    Get WebElements    css:.card-title
   FOR    ${element}    IN    @{LIST}
       Log    ${element.text}    
   END


