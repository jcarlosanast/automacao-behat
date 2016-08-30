@javascript

Feature: Com o propósito que ex-clientes catho, possam renovar a assinatura utilizando o voucher da parceria Microlins,

  @Inclusao
    Scenario: Fazer assinatura da Catho utilizando o Voucher de Desconto
      Given que eu acesso a url especifica da parceria
        And informo o id da campanha
        And visualizo a tela do P1
        And realizo um Cadastro
      When clico no botão Escolher Plano
        And vejo a tela de pagamento Personalizada
        And informo meu Voucher
        And clico em aplicar desconto
        And vejo meu desconto na assinatura
        And seleciono um plano
        And seleciono o forma de pagamento
        And seleciono o a bandeira
        And informo o numero do cartao
        And informo o mes '9' da validade
        And informo o ano '26' da validade
        And informo o nome
        And informo codigo de Segurança
        And clico no botão para Continuar
      Then visualizo a tela de boas Vinda
        And clico na apção "não quero preencher agora"
        And fecho a tela de boas vindas
        And clico em Entendi nas tela de ajuda
        And clico na Minha conta
        And clico na opção Dados da Assinatura
        And Visualizo o plano 'Profissional Semestral Cartão 6X'
        And visualizo o valor 'R$ 299,40'
        And visualizo o valor '6 parcelas de R$ 49,90'
        And fecho a tela dos Dados da Assinatura
        And clico na Minha conta
        And clico em sair

 @reativacao
    Scenario: Ex-cliente catho que possa fazer a renovação utilizando voucher de descontos
      Given que eu acesso a url especifica da parceria
        And informo o id da campanha
      When clico em login
        And informo meu usuario 'teste@timespartacus.uk' e senha '654654654'
        And clico em Entrar
      Then visualizo meus dados na home
        And clico em reativar assinatura
        And vejo a tela de pagamento Personalizada

  @ckorigem
    Scenario: Atribuir origem a clientes pelo fluxo de "Campanhas"
      Given que eu acesso a url especifica da parceria
      When informo o id da campanha
        And visualizo a tela do P1
      Then devo ter a origem 'SP1teste01' atribuido a mim

  @InclusaoPrecoZero
    Scenario: Fazer assinatura da Catho utilizando o Voucher de Desconto
      Given que eu acesso a url especifica da parceria
        And informo o id da campanha Preço Zero
        And visualizo a tela do P1
        And realizo um Cadastro
      When clico no botão Escolher Plano
        And vejo a tela de pagamento Personalizada
        And informo meu Voucher Preço Zero
        And clico em aplicar desconto
        And vejo meu desconto na assinatura
        And vejo o plano com valor zero
        #And vejo o plano da recorrencia
        And seleciono um plano
        And seleciono o forma de pagamento
        And seleciono o a bandeira
        And informo o numero do cartao
        And informo o mes '9' da validade
        And informo o ano '26' da validade
        And informo o nome
        And informo codigo de Segurança
        And clico no botão para Continuar
      Then visualizo a tela de boas Vinda
        And clico na apção "não quero preencher agora"
        And fecho a tela de boas vindas
        And clico em Entendi nas tela de ajuda
        And clico na Minha conta
        And clico na opção Dados da Assinatura
        And Visualizo o plano 'Profissional Semestral Cartão 6X'
        And visualizo o valor 'R$ 0,00'
        And visualizo o valor '1 parcelas de R$ 0,00'
        And fecho a tela dos Dados da Assinatura
        And clico na Minha conta
        And clico em sair

  @reativacaoPrecoZero
    Scenario: Ex-cliente catho que possa fazer a renovação utilizando voucher de descontos
      Given que eu acesso a url especifica da parceria
        And informo o id da campanha Preço Zero
      When clico em login
        And informo meu usuario 'teste@timespartacus.uk' e senha '654654654'
        And clico em Entrar
      Then visualizo meus dados na home
        And clico em reativar assinatura
        And vejo a tela de pagamento Personalizada