*** Settings ***
Resource                                    ${CURDIR}${/}../helpers/cardManagement_helper.resource
# Resource                                    ${CURDIR}${/}../helpers/home_helper.resource

*** Keywords ***
User is in setting page
      Click on setting in homepage

User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters valid card data and clicks on inquiry button
      [Arguments]  ${card_num}  ${expire_year}  ${expire_month}
      Click on card management in setting page
      Click on "کارتهای من" tab
      Click on add new card button
      Enter card number  ${card_num}
      Enter expiration date  ${expire_year}  ${expire_month}
      Click on inquiry button

User confirms card
    Click on confirm button

User will see new card in saved cards
    [Arguments]  ${card_num}  ${expire_year}  ${expire_month}  ${card_owner}
      Check card is in saved cards  ${card_num}  ${expire_year}  ${expire_month}  ${card_owner}

User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters invalid card number, enters expiration date and clicks on inquiry button
    [Arguments]  ${wrong_card_num}  ${expire_year}  ${expire_month}
    User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters valid card data and clicks on inquiry button  ${wrong_card_num}  ${expire_year}  ${expire_month}

User navigates to setting page>card management> "کارتهای من", tries to add new card, leaves card number empty, enters expiration date
    [Arguments]  ${expire_year}  ${expire_month}
    Click on card management in setting page
    Click on "کارتهای من" tab
    Click on add new card button
    Enter expiration date  ${expire_year}  ${expire_month}

User navigates to setting page>card management> "کارتهای من", tries to add new card, enters card number, leaves expiration date empty
    [Arguments]  ${card_num}
  Click on card management in setting page
  Click on "کارتهای من" tab
  Click on add new card button
  Enter card number ${card_num}

User will see proper message
    [Arguments]  ${msg}
    Validate error message  ${msg}

User navigates to setting page>card management> "کارتهای من" tab and tries to add a card to useful cards
    [Arguments]  ${card_num}
    Click on card management in setting page
    Click on "کارتهای من" tab
    Click on "more" icon  ${card_num}
    Click on add to useful Cards

User navigates to setting page>card management> "کارتهای من" tab and tries to delete a card from useful cards
    [Arguments]  ${card_num}
    Click on card management in setting page
    Click on "کارتهای من" tab
    Click on "more" icon  ${card_num}
    Click on delete from useful Cards

Inquiry button is not interactable
    Check inquiry button is interactable

Card will add to useful cards
    [Arguments]  ${card_num}
    Check card is in useful cards  ${card_num}

Then Card will delete from useful cards
    [Arguments] ${card_num}
    Check card is not in useful cards  ${card_num}

User navigates to setting page>card management> "کارتهای من" tab and tries to edit card name
    [Arguments]  ${card_num}  ${new_card_name}
    Click on Click on card management in setting page
    Click on "کارتهای من" tab
    Click on "more" icon  ${card_num}
    Click on edit card name
    Enter new card name  ${new_card_name}
    Click on save button

Then Card name will change
    [Arguments] ${card_num} ${new_card_name}
    Check card name  ${card_num}  ${new_card_name}

User navigates to setting page>card management> "کارتهای من" tab and tries to delete a card
    [Arguments] ${card_num}
    Click on Click on card management in setting page
    Click on "کارتهای من" tab
    Click on "more" icon  ${card_num}
    Click on delete card

Confirms deletion
    Click on confirm deletion button

Card will delete
    [Argumnets] ${card_num}
    Check card is not in saved cards  ${card_num}

User navigates to setting page>card management> "کارتهای دیگران" , tries to add new card, enters valid card number and clicks on inquiry button
    [Arguments] ${others_card_num}
    Click on card management in setting page
    Click on "کارتهای دیگران" tab
    Click on add new card button
    Enter card number ${card_num}
    Click on inquiry button

User navigates to setting page>card management> "کارتهای دیگران" , tries to add new card, enters invalid card number and clicks on inquiry button
    [Arguments] ${card_num}
    When User navigates to setting page>card management> "کارتهای دیگران" , tries to add new card, enters invalid card number and clicks on inquiry button ${card_num}

When User navigates to setting page>card management> "کارتهای دیگران", tries to add new card, leaves card number empty
    Click on card management in setting page
    Click on "کارتهای دیگران" tab
    Click on add new card button

User navigates to setting page>card management> "کارتهای دیگران" tab and tries to add a card to useful cards
    [Arguments] ${card_num}
    Click on card management in setting page
    Click on "کارتهای دیگران" tab
    Click on "more" icon  ${card_num}
    Click on add to useful Cards

User navigates to setting page>card management> "کارتهای دیگران" tab and tries to delete a card from useful cards
    [Arguments] ${card_num}
    Click on card management in setting page
    Click on "کارتهای دیگران" tab
    Click on "more" icon  ${card_num}
    Click on delete from useful Cards

When User navigates to setting page>card management> "کارتهای دیگران" tab and tries to delete a card
    [Arguments] ${card_num}
    Click on card management in setting page
    Click on "کارتهای دیگران" tab
    Click on "more" icon  ${card_num}
    Click on delete card
