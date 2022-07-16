*** Settings ***
Documentation                               This file includes test cases related to card management requirement
Default Tags                                login
Resource                                    ${CURDIR}${/}../steps/cardManagement_steps.robot
# Resource                                    ${CURDIR}${/}../../../resources/all.resource
#Suite Setup                                 Set Suite Environment
# Test Teardown                            Close All Browsers

*** Variables ***
${card_num}                                 5022 2910 9104 6407
${expire_year}                              1406
${expire_month}                              09
${success_msg}                              عملیات با موفقیت انجام شد.
*** Test Cases ***
#################################################  My Cards Test Cases - Add  ############################################################################################
Add a valid card to my cards in card management
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters valid card data and clicks on inquiry button  ${card_num}  ${expire_year}  ${expire_month}
    And User confirms card
    Then User will see new card in saved cards  ${card_num}  ${expire_year}  ${expire_month}  ${card_owner}
    And User will see proper message  ${success_msg}

Add a card with invalid card number to my cards in card management
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من" , tries to add new card, enters invalid card number, enters expiration date and clicks on inquiry button  ${invalid_card_num}  ${expire_year}  ${expire_month}
    Then User will see proper message  ${invalid_card_num_error_msg}

Add a card my cards in card management with empty card number
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من", tries to add new card, leaves card number empty, enters expiration date  ${expire_year}  ${expire_month}
    Then Inquiry button is not interactable

Add a card to my cards in card management with empty card number
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من", tries to add new card, enters card number, leaves expiration date empty  ${card_num}
    Then Inquiry button is not interactable

#################################################  My Cards Test Cases - Add To Useful Cards  ############################################################################################
Add card to useful Cards
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من" tab and tries to add a card to useful cards  ${card_num}
    Then Card will add to useful cards  ${card_num}
    And User will see proper message  ${success_message}

#################################################  My Cards Test Cases - Delete From Useful Cards  ############################################################################################
Delete card from useful Cards
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من" tab and tries to delete a card from useful cards  ${card_num}
    Then Card will delete from useful cards  ${card_num}
    And User will see proper message  ${add_to_useful_success_message}


#################################################  My Cards Test Cases - Edit Card Name  ############################################################################################
Edit a card name
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من" tab and tries to edit card name  ${card_num}  ${new_card_name}
    Then Card name will change  ${card_num}  ${new_card_name}
    And User will see proper message  ${success_msg}

#################################################  My Cards Test Cases - Delete Cards  ############################################################################################
# کارت به یک تراکنش  پر تکرار متصل است
Delete a card from my cards that is binded to a saved transaction
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من" tab and tries to delete a card  ${saved_transaction_card_num}
    And Confirms deletion
    Then Card will delete  ${saved_transaction_card_num}
    And User will see proper message  ${success_msg}

Delete a card from my cards
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای من" tab and tries to delete a card  ${card_num}
    Then Card will delete  ${card_num}
    And User will see proper message  ${success_msg}

#################################################  Others Cards Test Cases - Add  ############################################################################################
Add a valid card to others cards in card management
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای دیگران" , tries to add new card, enters valid card number and clicks on inquiry button   ${others_card_num}
    And User confirms card  ${others_card_num}
    Then User will see new card in saved cards

Add a card with invalid card number to others cards in card management
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای دیگران" , tries to add new card, enters invalid card number and clicks on inquiry button     5555444433332222
    Then User will see proper message  ${invalid_card_num_error_msg}

Add a card to others cards in card management with empty card number
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای دیگران", tries to add new card, leaves card number empty
    Then Inquiry button is not interactable

#################################################  Others Cards Test Cases - Add To Useful Cards  ############################################################################################
Add card to useful Cards
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای دیگران" tab and tries to add a card to useful cards ${card_num}
    Then Card will add to useful cards
    And User will see proper message ${success_message}

#################################################  Others Cards Test Cases - Delete From Useful Cards  ############################################################################################
    Add card to useful Cards
        Given User is in setting page
        When User navigates to setting page>card management> "کارتهای دیگران" tab and tries to delete a card from useful cards ${card_num}
        Then Card will delete from useful cards
        And User will see proper message ${success_message}
#################################################  My Cards Test Cases - Delete Cards  ############################################################################################
# کارت به یک تراکنش  پر تکرار متصل است
Delete a card from others cards that is binded to a saved transaction
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای دیگران" tab and tries to delete a card ${card_num}
    And Confirms deletion
    Then Card will delete  ${card_num}
    And User will see proper message ${success_msg}

Delete a card from others cards
    Given User is in setting page
    When User navigates to setting page>card management> "کارتهای دیگران" tab and tries to delete a card ${card_num}
    Then Card will delete  ${card_num}
    And User will see proper message ${success_msg}
