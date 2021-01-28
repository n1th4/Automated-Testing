*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${REGISTER URL}    http://${SERVER}/Sec02/EventRegistration.html
${SUCCESS URL}    http://${SERVER}/Sec02/Success.html
${DELAY}          0
${VALID FIRSTNAME}    Somsri
${VALID LASTNAME}    Sodsai
${VALID EMAIL}    somsri@kkumail.com
${INVALID EMAIL}    somsri@
${FIRSTNAME ERROR MESSAGE}    Please enter your first name!!
${LASTNAME ERROR MESSAGE}    Please enter your last name!!
${NAME ERROR MESSAGE}    Please enter your name!!
${EMAIL ERROR MESSAGE}    Please enter your email!!
${INVALID EMAIL ERROR MESSAGE}    Please enter a valid email address, e.g., somchai@kku.ac.th

*** Test Cases ***
Open Event Registration Page
	Open Browser    ${REGISTER URL}    ${BROWSER}
	Location Should Be    ${REGISTER URL}
	Capture Page Screenshot    filename=openpage.png
	Set Selenium Speed    ${DELAY}
	
Empty First Name
    Input Text    firstname    ${EMPTY}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    email    ${VALID EMAIL}
    Capture Page Screenshot    filename=fillform_nofirstname.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${FIRSTNAME ERROR MESSAGE}
    Capture Page Screenshot    filename=emptyfirstname.png
	
Empty Last Name
    Go To    ${REGISTER URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${EMPTY}
	Input Text    email    ${VALID EMAIL}
    Capture Page Screenshot    filename=fillform_nolastname.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${LASTNAME ERROR MESSAGE}
    Capture Page Screenshot    filename=emptylastname.png

Empty First Name And Last Name
    Go To    ${REGISTER URL}
    Input Text    firstname    ${EMPTY}
	Input Text    lastname    ${EMPTY}
	Input Text    email    ${VALID EMAIL}
    Capture Page Screenshot    filename=fillform_noname.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${NAME ERROR MESSAGE}
    Capture Page Screenshot    filename=emptyname.png	
	
Empty Email
    Go To    ${REGISTER URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    email    ${EMPTY}
    Capture Page Screenshot    filename=fillform_nomail.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${EMAIL ERROR MESSAGE}
    Capture Page Screenshot    filename=emptyemail.png
	
Invalid Email
    Go To    ${REGISTER URL}
    Input Text    firstname    ${VALID FIRSTNAME}
	Input Text    lastname    ${VALID LASTNAME}
	Input Text    email    ${INVALID EMAIL}
    Capture Page Screenshot    filename=fillform_invalidmail.png
    Click Button    registerButton
    Location Should Contain    ${REGISTER URL}
    Wait Until Page Contains    ${INVALID EMAIL ERROR MESSAGE}
    Capture Page Screenshot    filename=invalidemail.png
	
	[Teardown]    Close Browser