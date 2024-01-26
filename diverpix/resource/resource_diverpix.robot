*** Settings *** 
Documentation    Resources do Diverpix  (Todos os locators)
Library          AppiumLibrary
Resource         ../utils.robot


*** Variables ***
#ads
${FEEDBACK_MSG}              xpath=//android.widget.TextView[@text='feedback']
${ICON_CLOSE_ADS0}           id=tt_video_ad_close
${ICON_CLOSE_ADS1}           class=android.widget.ImageView
${ICON_CLOSE_ADS2}           xpath=//android.widget.ImageView[@content-desc="Ad closed"] 
${ICON_CLOSE_ADS3}           class=android.view.View

#menu
${BTN_CONTINUAR}             android.widget.TextView
${BTN_PERMITIR}              com.android.permissioncontroller:id/permission_allow_button
${EMAIL}                     com.google.android.gms:id/account_display_name
${BTN_ENTENDI}               Entendi

#Dashboard
${OPCAO_PERFIL}              accessibility_id=Perfil
${OPCAO_INICIO}              accessibility_id=Início
${OPCAO_RESGATAR}            accessibility_id=Resgatar
${ACESSAR_BAU}               //*[@resource-id = 'home_screen_card_daily_rewarded']
${SAIR_MAPA}                 //*[@resource-id = 'map_return']
${VOLTAR_EXTRATO}            class=android.widget.Button

#dias
${DIA_1}                     //*[@resource-id = 'map_daily_1']
${DIA_2}                     //*[@resource-id = 'map_daily_2']
${DIA_3}                     //*[@resource-id = 'map_daily_3']
${DIA_4}                     //*[@resource-id = 'map_daily_4']

#baus
${BTN_JOGAR}                 //*[@resource-id = 'PlayButtonIntroAccessScreenTestTag']
${FECHAR_JOGO_BAUS}          //*[@resource-id = 'GameScreenCloseIconTestTag']
${SAIR_JOGO_BAUS}            //*[@resource-id = 'ExitDialogConfirmButtonTestTag']
${VOLTAR_AO_JOGO_BAUS}       //*[@resource-id = 'game_screen_back']
${FECHAR_DIALOG_BAUS}        //*[@resource-id = 'game_screen_close']
${VOLTAR_AO_MAPA}            //*[@resource-id = 'IntroAccessScreenCloseIconTestTag']

${BAU_1}                     //*[@resource-id = 'ClosedChestTestTag_1']
${BAU_2}                     //*[@resource-id = 'ClosedChestTestTag_2']
${BAU_5}                     //*[@resource-id = 'ClosedChestTestTag_5'] 
${BAU_7}                     //*[@resource-id = 'ClosedChestTestTag_7']   
${BAU_13}                    //*[@resource-id = 'ClosedChestTestTag_13']

${MSG_BAUS}                  Abra 5 baús e ganhe mobcoins.
${CONTINUAR_JOGANDO}         //*[@resource-id = 'RescueButtonTestTag']
${ADJOE}                     //*[@resource-id = 'play_adjoe']
${TELA_ADJOE}                id=android:id/navigationBarBackground
${AYET}                      //*[@resource-id = 'play_ayet']
${TELA_AYET}                 Jogue ou realize missões
${ADGATE}                    //*[@resource-id = 'play_adgate']
${TELA_ADGATE}               id=com.mobapps.ganhardinheiro:id/close_button

#login
${BTN_LOGIN}                //*[@resource-id = 'login']
${BTN_LOGOFF}               //*[@resource-id = 'option_logoff']
${CONFIRMAR_LOGOFF}         //*[@resource-id = 'confirm_logoff']
${BTN_EXCLUIR}              //*[@resource-id = 'option_delete']
${BTN_EXCLUIR_CONTA}        //*[@resource-id = 'delete_account']
${CONFIRMAR_EXCLUSAO}       //*[@resource-id = 'confirm_delete']

*** Keywords ***
Abrir o Diverpix pela primeira vez
    Log To Console    -- Abrindo o Diverpix pela primeira vez --
    Open Application    ${REMOTE_URL}                platformName=${PLATFORM_NAME}                            platformVersion=${PLATFORM_VERSION}    
    ...                 deviceName=${DEVICE_NAME}    app=${APK_PATH_HML}    appPackage=${APP_PACKAGE}  appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}
Abrir o Diverpix
    [Arguments]         ${appPath}=${APK_PATH_HML}
    Log To Console    -- Abrindo o Diverpix --
    Open Application    ${REMOTE_URL}                platformName=${PLATFORM_NAME}           platformVersion=${PLATFORM_VERSION}
    ...                 deviceName=${DEVICE_NAME}    app=${APK_PATH_HML}    appPackage=${APP_PACKAGE}  appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}    noReset=${NO-RESET}
Setup login
    Abrir o Diverpix pela primeira vez
    Dado que fechei o anúncio da splash
    Quando acesso as opções de login
    Então realizo o login    

Dado que fechei o anúncio da splash
    Wait Until Page Contains Element      ${ICON_CLOSE_ADS2}  timeout=40s
    Click Element      ${ICON_CLOSE_ADS2}
    Sleep    5s

Quando acesso as opções de login
    Go Back
    Wait Until Element Is Visible    ${OPCAO_PERFIL}    timeout=10s
    Click Element    ${OPCAO_PERFIL}

Então realizo o login
    Wait Until Element Is Visible    ${BTN_LOGIN}
    Click Element    ${BTN_LOGIN}
    Page Should Contain Text    Google
    Click Text    Google
    Wait Until Element Is Visible    ${EMAIL}    timeout=7s
    Click Element    ${EMAIL}
    Sleep    3s
    Text Should Be Visible    ${BTN_ENTENDI}

Quando acesso a recompensa diária      
    Page Should Contain Text    Suas moedas
    Click Element    ${ACESSAR_BAU}
    Sleep    8s
    Wait Until Element Is Visible    ${DIA_1}
    Click Element    ${DIA_1}

E começo a jogar
    Wait Until Element Is Visible     ${BTN_JOGAR}       timeout=15s
    Click Element         ${BTN_JOGAR}
    Wait Until Page Contains Element  ${ICON_CLOSE_ADS2}  timeout=35s
    Click Element  ${ICON_CLOSE_ADS2}
    Sleep    3s
Então abro baus e recebo a recompensa
    Page Should Contain Text    ${MSG_BAUS}    timeout=10s
    Click Element               ${BAU_1}
    Click Element               ${BAU_2}
    Click Element               ${BAU_5}
    Click Element               ${BAU_7}
    Click Element               ${BAU_13}
    Wait Until Element Is Visible    ${CONTINUAR_JOGANDO}    timeout=10s
    Click Element    ${CONTINUAR_JOGANDO}
    Wait Until Element Is Visible     ${BTN_JOGAR}       timeout=15s

Então decido sair do jogo e voltar para home
    Wait Until Element Is Visible        ${FECHAR_JOGO_BAUS}    timeout=10s
    Click Element    ${FECHAR_JOGO_BAUS}
    Wait Until Element Is Visible    ${SAIR_JOGO_BAUS}    timeout=10s
    Click Element    ${SAIR_JOGO_BAUS}
    Wait Until Element Is Visible    ${SAIR_MAPA}    timeout=7s
    Click Element    ${SAIR_MAPA}
    Wait Until Element Is Visible    ${ACESSAR_BAU}    timeout=7s

Quando clico na opção de extrato
    Text Should Be Visible    Extrato
    Click Text    Extrato
    Wait Until Page Contains Element    ${VOLTAR_EXTRATO}    timeout=7s
    Text Should Be Visible    Movimentações recentes

Então vejo meu saldo total e transações
    Click Element    ${VOLTAR_EXTRATO}
    Wait Until Element Is Visible    ${ACESSAR_BAU}    timeout=7s

Quando clico na opção de resgate
    Wait Until Element Is Visible    ${OPCAO_RESGATAR}    timeout=10s
    Click Element    ${OPCAO_RESGATAR}
    Text Should Be Visible    Resgate com Pix

Então vejo se meu saldo é suficiente
    Text Should Be Visible    Como funciona o resgate?
    Click Element    ${OPCAO_INICIO}
    Wait Until Element Is Visible    ${ACESSAR_BAU}    timeout=7s

Quando acesso as opções de logoff
    Wait Until Element Is Visible    ${OPCAO_PERFIL}    timeout=10s
    Click Element    ${OPCAO_PERFIL}
    Wait Until Element Is Visible    ${BTN_LOGOFF}    timeout=7s

Então realizo o logoff
    Click Element    ${BTN_LOGOFF}
    Wait Until Element Is Visible    ${CONFIRMAR_LOGOFF}    timeout=7s
    Click Element    ${CONFIRMAR_LOGOFF}
    Wait Until Element Is Visible    ${BTN_LOGIN}    timeout=7ss

Quando acesso a Adjoe
    Wait Until Element Is Visible    ${ACESSAR_BAU}    timeout=3s
    Click Element    ${ADJOE} 
    Wait Until Element Is Visible    ${BTN_PERMITIR}
    Go Back
    Wait Until Element Is Visible    ${TELA_ADJOE}    timeout=4s
Quando acesso a Adgate
    Wait Until Element Is Visible    ${ACESSAR_BAU}    timeout=3s
    Click Element    ${ADGATE}
    Wait Until Element Is Visible    ${TELA_ADGATE}    timeout=4s
Quando acesso a Ayet
    Wait Until Element Is Visible    ${ACESSAR_BAU}    timeout=3s
    Click Element    ${AYET}
    Sleep    4s
    Text Should Be Visible    ${TELA_AYET}    
Então retorno para a tela inicial
    Go Back
    Wait Until Element Is Visible    ${ACESSAR_BAU}    timeout=5s    
E seleciono a opção de exclusão
    Click Element    ${BTN_EXCLUIR}
    Wait Until Element Is Visible    ${BTN_EXCLUIR_CONTA}    timeout=7s
    Click Element    ${BTN_EXCLUIR_CONTA}
    Sleep    2s
    Wait Until Element Is Visible    ${CONFIRMAR_EXCLUSAO}    timeout=7s
Então meu usuário é excluído
    Click Element    ${CONFIRMAR_EXCLUSAO}
    Text Should Be Visible    Conta excluída com sucesso.