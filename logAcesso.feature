#language: pt-br
@javascript

Feature: Gravar acoes dos usuarios no Log no Banco de Campanhas

	Quando vou executar alguma alteração no sistema de parceria
			Gostaria de evidenciar as ações feitas pelos usuarios
			Como forma de seguranças para as campanhas

	@logLogar
		Scenario: Logar no Sistema de Parcerias
			Given que acesso o url do sistema de parcerias
				And visualizo a tela de login
			When informo um usuario valido
				And a senha valida
				And clico em login
			Then devo visulizar o id do usuario na coluna usuario_ad_id no banco campanhas
				And a ação '1' 'Logou no Sistemana' na coluna acao_sistema_id no banco campanhas
				And o Id da campanha na coluna complemento do banco campanhas
				And a data e horario na coluna data_acao do banco campanhas

	@logDeslogar
		Scenario: Deslogar do Sistema de Parcerias
			Given que estou logado no sistema de parcerias
				And clico em nos dados do meu logim
			When clico em Logout
			 	And devo deslogado do sistema de parceiras
			Then devo visulizar o id do usuario na coluna usuario_ad_id no banco campanhas
				And a ação '3' 'Deslogou do Sistema' na coluna acao_sistema_id do banco campanhas
				And o Id da campanha na coluna complemento do banco campanhas
				And a data e horario na coluna data_acao do banco campanhas

	@logCadastraParceiro
		Scenario: Cadastrar um Parceiro e gravar dados no log
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
			When clico em incluir "Novo Parceiro"
				And informo o nome "Time Spartacus"
				And informo a origem "SPA"
				And informo o HotSite "Spartacus"
				And informo o nome "Spartacus" para o contato
				And informo o email "spartacus@teste.uk" do contato
				And informo o login "spartacus" e acesso para o parceiro
				And informo a senha "654654654" para o usuario
				And clico em criar parceiro
				And visualizo a mensagem "Parceiro Cadastrado com Sucesso"
				And fecho a mensagem
			Then devo visulizar o id do usuario na coluna usuario_ad_id no banco campanhas
				And a ação '5' 'Cadastrou Parceiro' na coluna acao_sistema_id do banco campanhas
				And o Id da campanha na coluna complemento do banco campanhas
				And a data e horario na coluna data_acao do banco campanhas

	@logEditaParceiro
		Scenario: Editar Parceiro e gravar dados no log
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
				And clico no campo de pesquisa
				And informo o parceiro "Time Spartacus 3"
			When vejo "Parceiro" "Time Spartacus 3" na lista
				And clico no parceiro
				And visualizo o cadastro do parceiro
				And altero o status do Parceiro para "Inativo"
				And informo um novo email "parceirodesativado@teste.uk"
				And clico em Salvar Parceiro
		    	And visualizo a mensagem "Parceiro Alterado com Sucesso"
				And fecho a mensagem
			Then devo visulizar o id do usuario na coluna usuario_ad_id no banco campanhas
				And a ação '7' 'Editou Parceiro' na coluna acao_sistema_id do banco campanhas
				And o Id da campanha na coluna complemento do banco campanhas
				And a data e horario na coluna data_acao do banco campanhas

	@logCadastraCampanha
		Scenario: Cadastrar Campanha e gravar dados no log
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome Time Spartacus para o parceiro
				And informo o nome "Campanha de Teste Em Andamento" para campanha
				And informo a ação "teste01"
				And informo uma data atual para inicio da campanha
				And informo uma data '01/06/2030' para validade da campanha
				And seleciono o Tipo da Campanha 'Voucher'
				And seleciono o 'primeiro' Grupo de plano para Campanha
				And informo que a campanha 'Não' terá repasse
				And seleciono o plano 'Mensal' que será exibido na Tela do Seguro
				And seleciono o plano 'Trimestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Semestral' que será exibido na Tela do Seguro
			 	And seleciono o plano 'Anual' que será exibido na Tela do Seguro
				And clico em Criar Campanha
				And visualizo a mensagem "Campanha Cadastrada com Sucesso"
				And fecho a mensagem
			Then devo visulizar o id do usuario na coluna usuario_ad_id no banco campanhas
				And a ação '9' 'Cadastrou Campanha' na coluna acao_sistema_id do banco campanhas
				And o Id da campanha na coluna complemento do banco campanhas
				And a data e horario na coluna data_acao do banco campanhas

	@logEditarCampanha
		Scenario: Editar Campanha e Gravar dados no log
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
				And clico no campo de pesquisa
				And informo a campanha "Campanha de Teste Em Andamento"
			When vejo "Campanha" "Campanha de Teste Em Andamento" na lista
				And clico na campanha
				And visualizo o cadastro da Campanha "Campanha de Teste Em Andamento"
				And seleciono o plano 'Semestral Combo' que será exibido na Tela do Seguro
				And clico em Salvar a Campanha
				And visualizo a mensagem "Campanha Cadastrada com Sucesso"
			Then devo visulizar o id do usuario na coluna usuario_ad_id no banco campanhas
				And a ação '11' 'Editou Campanha' na coluna acao_sistema_id do banco campanhas
				And o Id da campanha na coluna complemento do banco campanhas
				And a data e horario na coluna data_acao do banco campanhas