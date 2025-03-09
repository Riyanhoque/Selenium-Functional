*** Settings ***
Documentation    A resousce file is used for reusedable keywords and variables 

Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${User_invalid_id}        rahulshe
${User_Valid_id}          rahulshettyacademy 
${User_invalidpass}       124343
${User_valid_pass}        learning
${Url}        https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortagage payment url
    Create Webdriver    Chrome
    Go To    ${Url}
    Maximize Browser Window

