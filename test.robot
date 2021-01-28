*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${REGISTER URL}    http://${SERVER}/Sec01/EventConfirmation.html
${SUCCESS URL}    http://${SERVER}/Sec01/Success.html
${DELAY}          0
${VALID FIRSTNAME}    Somsri
${VALID LASTNAME}    Sodsai
${VALID PHONENUMBER}    081-001-1234

*** Testcases ***
Open Lucky Draw Registration Page
	Open Browser    ${REGISTER URL}    ${BROWSER}
	Location Should Be    ${REGISTER URL}
	Capture Page Screenshot    filename=openpage.png
	Set Selenium Speed    ${DELAY}
	
Register Success
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    phone    ${VALID PHONENUMBER}
    Capture Page Screenshot    filename=fillform.png
    Click Button    registerButton
    Location Should Contain    ${SUCCESS URL}
    Wait Until Page Contains    Success
	Wait Until Page Contains    Thank you for your participation. We will call back to the winner.
    Capture Page Screenshot    filename=successpage.png

	[Teardown]    Close Browser