*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}          localhost:7272
${BROWSER}         Chrome
${REGISTER URL}    http://${SERVER}/Sec01/EventConfirmation.html
${SUCCESS URL}    http://${SERVER}/Sec01/Success.html
${DELAY}          0
${VALID FIRSTNAME}    Somsri
${VALID LASTNAME}    Sodsai
${VALID PHONENUMBER}    081-001-1234
${INVALID PHONENUMBER}    1234
${FIRSTNAME ERROR MESSAGE}    Please enter your first name!!
${LASTNAME ERROR MESSAGE}    Please enter your last name!!
${NAME ERROR MESSAGE}    Please enter your name!!
${EMPTY PHONENUMBER ERROR MESSAGE}    Please enter your phone number!!
${INVALID PHONENUMBER ERROR MESSAGE}    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)

*** Test Cases ***
Open Lucky Draw Registration Page
	Open Browser    ${REGISTER URL}    ${BROWSER}
	Location Should Be    ${REGISTER URL}
	Capture Page Screenshot    filename=openpage.png
	Set Selenium Speed    ${DELAY}
	
Empty First Name
    Input Text    firstname    ${EMPTY}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    phone    ${VALID PHONENUMBER}
    Capture Page Screenshot    filename=fillform_nofirstname.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${FIRSTNAME ERROR MESSAGE}
    Capture Page Screenshot    filename=emptyfirstname.png
	
Empty Last Name
    Go To    ${REGISTER URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${EMPTY}
	Input Text    phone    ${VALID PHONENUMBER}
    Capture Page Screenshot    filename=fillform_nolastname.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${LASTNAME ERROR MESSAGE}
    Capture Page Screenshot    filename=emptylastname.png

Empty First Name And Last Name
    Go To    ${REGISTER URL}
    Input Text    firstname    ${EMPTY}
	Input Text    lastname    ${EMPTY}
	Input Text    phone    ${VALID PHONENUMBER}
    Capture Page Screenshot    filename=fillform_noname.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${NAME ERROR MESSAGE}
    Capture Page Screenshot    filename=emptyname.png	
	
Empty Phone Number
    Go To    ${REGISTER URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    phone    ${EMPTY}
    Capture Page Screenshot    filename=fillform_nophone.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${EMPTY PHONENUMBER ERROR MESSAGE}
    Capture Page Screenshot    filename=emptyphone.png
	
Invalid Phone Number
    Go To    ${REGISTER URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    phone    ${INVALID PHONENUMBER}
    Capture Page Screenshot    filename=fillform_invalidphone.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${INVALID PHONENUMBER ERROR MESSAGE}
    Capture Page Screenshot    filename=invalidphone.png
	
	[Teardown]    Close Browser