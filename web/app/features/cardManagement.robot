*** Settings ***
Documentation                               This file includes test cases related to card amnagement requirement
Default Tags                                login
Resource                                    ${CURDIR}${/}../steps/cardManagement_steps.robot
Resource                                    ${CURDIR}${/}../../../resources/all.resource
Suite Setup                                 Set Suite Environment
Test Teardown                               Close All Browsers

*** Test Cases ***
#################################################  My Cards Test Cases - ADD  ############################################################################################
Add a valid card to my cards in card management
[Arguments] ${card_num} ${expire_year}  ${expire_month}
Given  User is in setting page
When   User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters valid card data and clicks on inquiry button            ${card_num}   ${expire_year}    ${expire_month}
And   User confirms card
Then  User will see new card in saved cards

Add a card with invalid card number to my cards in card management
[Arguments] ${expire_year}  ${expire_month} ${error_msg}
Given  User is in setting page
When   User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters invalid card number, enters expiration date and clicks on inquiry button     5555444433332222   ${expire_year}    ${expire_month}
Then  User will see proper message  ${error_msg}

Add a card my cards in card management with empty card number
[Arguments] ${expire_year}  ${expire_month}
Given  User is in setting page
When  User navigates to setting page>card management> "کارتهای من", tries to add new card, leaves card number empty, enters expiration date        ${expire_year}    ${expire_month}
Then  Inquiry button is not interactable

Add a card my cards in card management with empty card number
[Arguments] ${card_num}
Given  User is in setting page
When   User navigates to setting page>card management> "کارتهای من", tries to add new card, enters card number, leaves expiration date empty      ${card_num}
Then  Inquiry button is not interactable

#################################################  My Cards Test Cases - ADD To Useful Cards  ############################################################################################
Add card to useful Cards

#################################################  My Cards Test Cases - Edit Card Name  ############################################################################################


#################################################  My Cards Test Cases - Delete Cards  ############################################################################################


#################################################  Others Cards Test Cases - ADD  ############################################################################################
Add a valid card to others cards in card management
[Arguments] ${card_num}
Given  User is in setting page
When   User navigates to setting page>card management> "کارتهای دیگران" , tries to add new card, enters valid card number and clicks on inquiry button            ${card_num}
And   User confirms card
Then  User will see new card in saved cards

Add a card with invalid card number to my cards in card management
[Arguments] ${error_msg}
Given  User is in setting page
When   User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters invalid card number and clicks on inquiry button     5555444433332222
Then  User will see proper message  ${error_msg}

#################################################  Others Cards Test Cases - ADD To Useful Cards  ############################################################################################


#################################################  My Cards Test Cases - Delete Cards  ############################################################################################
