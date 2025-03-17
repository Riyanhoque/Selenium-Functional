*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    XML
Test Setup        open the browser with the Mortagage payment url
# Test Teardown        Close Browser
Resource        resource.robot

*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Page}                       css:.nav-link

*** Test Cases ***    
Validate UnSuccesful Login         
    Fill the Loging form    ${User_invalid_id}    ${User_invalidpass}
    wait until Element is located in the page        ${Error_Message_Login}
    verify error message is correct 

Validate Cards display in the shopping page
    Fill the Loging form    ${User_Valid_id}    ${User_valid_pass}
    wait until Element is located in the page    ${Page}
    Verify card title in the shop page 
    Select the card        Blackberry
    Fill the login details and login form    





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
   @{actuallist} =    Create List
   FOR    ${element}    IN    @{LIST}
       Log    ${element.text}
       Append To List       ${actuallist}    ${element.text}   
   END
   
   Lists Should Be Equal        ${actuallist}    ${listelements}

Select the card 
    [Arguments]        ${Card_name}
    @{LIST} =    Get WebElements    css:.card-title
    ${index} =    Set Variable    1
    FOR    ${element}    IN    @{LIST}
        Exit For Loop If  '${Card_name}' == '${element.text}'


        ${index} =    Evaluate    ${index} + 1

    END
    Click Button    xpath:(//*[@class = 'card-footer'])[${index}]/button



Fill the login details and login form
    Input Text        id:username     rahulshettyacademy
    Input Password    id:password    learning
    Click Element     css:input[value='user']
    Wait Until Element Is Visible        css:.modal-footer   timeout= 15s 
    Click Button      id:okayBtn
    Wait Until Element Is Not Visible        css:.modal-footer
    Select From List By Value    css:Select.form-control    teach
    Select Checkbox     terms
    Checkbox Should Be Selected        terms








