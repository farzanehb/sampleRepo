*** Settings ***
Documentation                               Base resource file for all of test cases
Library                                     Selenium2Library
Library                                     Collections
Library                                     String

*** Variables ***
${url}                                          https://app.mydigipay.com/home
${setting_page}                               //button[@title='تنظیمات']
${card_management_link}                       //div[contains(text(),'مدیریت کارت‌ها')]
# add card locators
${my_cards_tab}                               //div[text()='کارت‌های من']
${Others_cards_tab}                           //div[text()='کارت‌های دیگران']
${add_btn}                                    //button[contains(@class,'digipay-btn')]
${card_number_input}                          //input[@formcontrolname='cardNumber']
${expire_date_input}                          //input[@formcontrolname='expirationDate']
${month_select}                               //option[text()='ماه']/parent::select
${year_select}                                //option[text()='سال']/parent::select
${confirm_date_link}                          //a[@class='resolve']
${inquiry_btn}                                //span[text()='استعلام']

# confirm added card
${bank_title}                                 //h3[@class='bank-title']
${saved_card_num}                             //div[contains(@class,'card-number')]/span
${card_owner}                                 //div[@class='left-side']/div[@class='value']
${expire_date}                                //div[contains(@class,'right-side')]/div[contains(@class,'value')]
${confirm_btn}                                //span[text()='تایید و ادامه']

# card options
${more_btn}                                   //span[text()='${card_num_value}']/following::span[contains(@class,'more-button')][1]
${card_num_value}
${add_to_useful_cards}                        //span[text()='افزودن به پرکاربردها']
${delete_from_useful_cards}                   //span[text()='حذف از پرکاربردها']
${edit_card}                                  //span[text()='ویرایش نام کارت']
${delete_card}                                //span[text()='حذف کارت']
${useful_icon}                                //span[text()='${card_num_value}']/preceding::div[contains(@class,'title-bar')][1]//span[contains(@class,'pinned-icon')]

# edit card name
${edit_name_input}                            //label[text()='نام کارت']/preceding::input
${edit_save_btn}                              //span[text()='ذخیره تغییرات']
${edit_cancel_btn}                            //span[text()='انصراف']

# delete card approve
${confirm_delete_btn}                         //button[text()='ادامه و حذف کارت ']

*** Keywords ***
 Click on setting in homepage
    Create Webdriver    Chrome    executable_path=C:/Users/f.bahramnejad/Desktop/TestAutomation/lib/chromedriver.exe
    Go To    ${url}
    Sleep    40
    Double Click Element    ${setting_page}

 Click on card management in setting page
    Wait Until Element Is Visible    ${card_management_link}   15
    Click Element    ${card_management_link}

Click on "کارتهای من" tab
    Wait Until Element Is Visible     ${my_cards_tab}   15
    Click Element    ${my_cards_tab}

Click on add new card button
    Wait Until Element Is Visible     ${add_btn}     15
    Click Element    ${add_btn}

Enter card number
    [Arguments]  ${card_num}
    Wait Until Element Is Visible     ${card_number_input}     15
    Input Text    ${card_number_input}   ${card_num}

Enter expiration date
    [Arguments]  ${expire_year}  ${expire_month}
    Wait Until Element Is Visible     ${expire_date_input}     15
    Click Element  ${expire_date_input}
    Select From List  ${month_select}  ${expire_month}
    Select From List  ${year_select}  ${expire_year}
    Click Element  ${confirm_date_link}

Click on inquiry button
    Wait Until Element Is Visible      ${inquiry_btn}     15
    Click Element    ${inquiry_btn}

Click on confirm button
    Wait Until Element Is Visible      ${confirm_btn}     15
    Click Element    ${confirm_btn}


Check card is in saved cards
    [Arguments]  ${card_num_text}  ${expire_year_text}  ${expire_month_text}  ${card_owner_text}
    Element Text Should Be    ${card_owner}   ${card_owner_text}
    Element Text Should Be    ${saved_card_num}   ${card_num_text}
    Element Should Contain    ${expire_date}    ${expire_year_text}
    Element Should Contain    ${expire_date}    ${expire_month_text}

Validate error message
    [Arguments]  ${msg}
    Page Should Contain  ${msg}

Check inquiry button is interactable
    Element Should Be Disabled  ${inquiry_btn}/parent::button


Click on edit card name
    Click Element    ${edit_card}

Enter new card name
    [Arguments]  ${new_name}
    Input Text    ${edit_name_input}     ${new_name}

Click on save button
    Click Element    ${edit_save_btn}

Click on "کارتهای دیگران" tab
    Click Element   ${Others_cards_tab}

Click on add to useful Cards
    Click Element    ${add_to_useful_cards}

Click on delete from useful Cards
    Click Element    ${delete_from_useful_cards}

# needs to implement
Check card is in useful cards
    [Arguments]  ${card_num}
    ${card_num_value}=${card_num}
    Element Should Be Visible    ${useful_icon}

# Check a card is useful or not via icon element
Check card is not in useful cards
    [Arguments] ${card_num}
    ${card_num_value}=${card_num}
    Element Should Not Be Visible    ${useful_icon}

Check card name
    [Arguments]  ${card_num}  ${new_card_name}
    Element Text Should Be    ${saved_card_num}[text()=${card_num}]/preceding::${bank_title}    ${new_card_name}

Click on "more" icon
    [Arguments]  ${card_num}
    ${card_num_value}=${card_num}
    Click Element  ${more_btn}

Click on delete card
    Click Element    ${delete_card}

Click on confirm deletion button
    Click Element    ${confirm_delete_btn}

Check card is not in saved cards
    [Argumnets]  ${card_num}
    Page Should Not Contain    ${card_num}
