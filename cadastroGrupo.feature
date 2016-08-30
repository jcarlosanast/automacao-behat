#language: pt-br
@javascript

Feature: Cadastro de Grupo

	Quando vou fechar uma parceria com um grupo empresarial
			Gostaria de cadastrar as informações do grupo
			Para conseguir atrelar os parceiros que terão a campanha ativa

	@
		Scenario: Cadastrar grupo
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Grupos'
			When clico em incluir 'Novo Grupo'
				And clico no campo para informar o g	rupo
				And informo o nome "Novo Grupo" para o grupo
			Then visualizo a mensagem "Grupo Cadastrada com Sucesso"
				And fecho a mensagem
				And clico em Logout
	@
		Scenario: Editar o grupo
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Grupos'
				And clico no campo de pesquisa
				And informo o grupo "Novo Grupo"
   			When vejo "Grupo" "Novo Grupo" na lista
        		And clico no Grupo
        		And visualizo o cadastro do Gropo "Novo Grupo"
        		And informo o nome "Novo Spartacus" para grupo
				And clico em Salvar a Campanha
			Then visualizo a mensagem "Grupo Alterada com Sucesso"
				And fecho a mensagem
				And clico em Logout
	@
		Scenario: Cadastro grupo para ser Excluido
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Grupos'
			When clico em incluir 'Novo Grupo'
				And clico no campo para informar o grupo
				And informo o nome "Grupo a ser deletado" para o grupo
			Then visualizo a mensagem "Grupo Cadastrada com Sucesso"
				And fecho a mensagem

	@
		Scenario: Excluir grupo
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Grupos'
				And clico no campo de pesquisa
				And informo o grupo "Novo Grupo"
		   	When vejo "Grupo" "Grupo a ser deletado" na lista
		   		And clico para Exluir Grupo
		   	Then visualizo a mensagem "Grupo apagado com Sucesso"
		   		And fecho a mensagem
		   		And clico no campo de pesquisa
				And informo o grupo "Grupo a ser deletado"
				And visualizo a mensagem "Nenhum Registro Encontrado"
		   		And clico em Logout

	@
		Scenario: Tentar Excluir grupo que esteja vinculado a uma campanha
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Grupos'
				And clico no campo de pesquisa
				And informo o grupo "Novo Grupo"
		   	When vejo "Grupo" "Grupo a ser deletado" na lista
		   		And clico para Exluir Grupo
		   	Then visualizo a mensagem "Grupo vinculado a uma campanha ativa"
		   		And fecho a mensagem