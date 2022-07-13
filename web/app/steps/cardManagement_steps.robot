*** Settings ***
Resource                                    ${CURDIR}${/}../helpers/cardManagement_helper.resource
Resource                                    ${CURDIR}${/}../helpers/home_helper.resource

*** Keywords ***
User is in setting page

User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters valid card data and clicks on inquiry button
[Arguments] ${card_num} ${expire_year}  ${expire_month}
      Click on card management in setting page
      Click on "کارتهای من" tab
      Click on add new card button
      Enter card number ${card_num}
      Enter expiration date ${expire_year} ${expire_month}
      Click on inquiry button

User confirms card
[Arguments] ${card_num} ${expire_year}  ${expire_month} ${card_owner}
    Ckeck card data   ${card_num}   ${expire_year}    ${expire_month} ${card_owner}
    Click on confirm/edit button

User will see new card in saved cards
[Arguments] ${card_num} ${expire_year}  ${expire_month} ${card_owner}
      Check card is in saved cards  ${card_num}   ${expire_year}    ${expire_month} ${card_owner}

User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters invalid card number, enters expiration date and clicks on inquiry button
[Arguments] ${wrong_card_num}  ${expire_year}  ${expire_month}
    User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters valid card data and clicks on inquiry button ${wrong_card_num}   ${expire_year}    ${expire_month}

User navigates to setting page>card management> "کارتهای من", tries to add new card, leaves card number empty, enters expiration date
[Arguments] ${expire_year}  ${expire_month}
    Click on card management in setting page
    Click on "کارتهای من" tab
    Click on add new card button
    Enter expiration date ${expire_year} ${expire_month}

User navigates to setting page>card management> "کارتهای من", tries to add new card, enters card number, leaves expiration date empty
 [Arguments] ${card_num}
  Click on card management in setting page
  Click on "کارتهای من" tab
  Click on add new card button
  Enter card number ${card_num}

User will see proper message
[Arguments] ${error_msg}
    Validate error message  ${error_msg}

Inquiry button is not interactable
    Check inquiry button is interactable
