*** Settings ***
Documentation                               Base resource file for all of test cases
Library                                     SeleniumLibrary
Library                                     Collections
Library                                     String

*** Variables ***
# add card locators
${my_cards_tab}                             //div[text()='کارت‌های من']
${Others_cards_tab}                        //div[text()='کارت‌های دیگران']
${add_btn}                                 //button[contains(@class,'digipay-btn')]
${card_number_input}                       //input[@formcontrolname='cardNumber']
${expire_date_input}                       //input[@formcontrolname='expirationDate']
${month_select}                            //option[text()='ماه']/parent::select
${year_select}                             //option[text()='سال']/parent::select
${confirm_date_link}                       //a[@class='resolve']
${inquiry_btn}                              //span[text()='استعلام']

# confirm card dialog locators
${bank_title}                             //h3[@class='bank-title']
${card_owner}                             //div[@class='left-side']/div[@class='value']
${expire_date}                             //div[contains(@class,'right-side')]/div[contains(@class,'value')]
${confirm_btn}                            //span[text()='تایید و ادامه']

# card options
${more_btn}                             //span[text()='${card_num}']/following::span[contains(@class,'more-button')][1]
${card_num}
${add_to_useful_cards}                  //span[text()='افزودن به پرکاربردها']
${edit_card}                            //span[text()='ویرایش نام کارت']
${delete_card}                            //span[text()='حذف کارت']

# edit card name
${edit_name_input}                      //label[text()='نام کارت']/preceding::input
${edit_save_btn}                             //span[text()='ذخیره تغییرات']
${edit_cancel_btn}                      //span[text()='انصراف']

# delete card approve
${delete_warn_message}
