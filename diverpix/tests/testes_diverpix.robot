*** Settings ***
Documentation    Testes no Diverpix 
Library          AppiumLibrary
Resource         ../resource/resource_diverpix.robot
Test Setup       Abrir o Diverpix
Test Teardown    Close Application

*** Test Cases ***
CTD01 - Login
    [Setup]    Abrir o Diverpix pela primeira vez
    Dado que fechei o anúncio da splash
    Quando acesso as opções de login
    Então realizo o login

CTD02 - Jogar jogo do baú
    Dado que fechei o anúncio da splash
    Quando acesso a recompensa diária 
    E começo a jogar
    Então abro baus e recebo a recompensa

CTD03 - Fechar jogo do baú
    Dado que fechei o anúncio da splash
    Quando acesso a recompensa diária 
    E começo a jogar
    Então decido sair do jogo e voltar para home

CTD04 - Acessar Adjoe
    Dado que fechei o anúncio da splash
    Quando acesso a Adjoe
    Então retorno para a tela inicial

CTD05 - Acessar Adgate
    Dado que fechei o anúncio da splash
    Quando acesso a Adgate
    Então retorno para a tela inicial

CTD06 - Acessar Ayet
    Dado que fechei o anúncio da splash
    Quando acesso a Ayet
    Então retorno para a tela inicial

CTD07 - Verificar extrato
    Dado que fechei o anúncio da splash
    Quando clico na opção de extrato
    Então vejo meu saldo total e transações

CTD08 - Acessar menu resgatar
    Dado que fechei o anúncio da splash
    Quando clico na opção de resgate
    Então vejo se meu saldo é suficiente

CTD09 - Logoff
    Dado que fechei o anúncio da splash
    Quando acesso as opções de logoff
    Então realizo o logoff
    
CTD10 - Excluir conta
    [Setup]    Setup login
    Quando acesso as opções de logoff
    E seleciono a opção de exclusão
    Então meu usuário é excluído