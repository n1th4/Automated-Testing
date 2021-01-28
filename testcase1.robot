*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${SERVER}    localhost:7272
${BROWSER}    Chrome
${LuckyPAGE}    http://${SERVER}/sec01/EventConfirmation.html
${SuccessPAGE}    http://${SERVER}/sec01/Success.html
${successMsg}    "Thank you for your participation. We will call back to the winner"


${FNAME}    Somsri
${LNAME}    Sodsai
${PHONE}    081-001-1234



*** Test Cases ***
Go To homepage
    Open Browser    ${LuckyPAGE}    ${BROWSER}
	Location Should Be    ${LuckyPAGE}
	
Register success
    Input Text   fullname     ${FNAME}
    Input Text   lastname     ${LNAME}
    Input Text   phone     ${PHONE}
    Click Button    registerButton
		Location Should Be    ${SuccessPAGE}
		Title Sould Be    Success
		Wait Until Page Contains	${successMsg}
		Close Browser
		
Firstname Defalt
    Input Text   lastname    ${LNAME}    
    Input Text   phone     ${PHONE}
    Click Button    registerButton
		Location Should Be    ${LuckyPAGE}
		Wait Until Page Contains	Please enter your first name!!
		Close Browser

Lastname Defalt
    Input Text   fullname    ${FNAME}    
    Input Text   phone     ${PHONE}
    Click Button    registerButton
		Location Should Be    ${LuckyPAGE}
		Wait Until Page Contains	Please enter your last name!!
		Close Browser
		
phone Defalt
    Input Text   fullname    ${FNAME}
    Input Text   lastname    ${LNAME}    
    Click Button    registerButton
		Location Should Be    ${LuckyPAGE}
		Wait Until Page Contains	Please enter your phone number!!
		Close Browser
		
Name Defalt
    Input Text   phone    ${PHONE}    
    Click Button    registerButton
		Location Should Be    ${LuckyPAGE}
		Wait Until Page Contains	Please enter your name!!
		Close Browser
		
Phone Error
    Input Text   phone    1234    
    Click Button    registerButton
		Location Should Be    ${LuckyPAGE}
		Wait Until Page Contains	Please enter a valid phone number, e.g.,081-234-5678, 081 234 5678, or 081.234.5678
		Close Browser
		

		