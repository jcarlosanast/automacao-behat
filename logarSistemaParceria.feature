#language: pt-br
@javascript

Feature: Acesso ao Sistema de Parcerias

	Quando vou planejar uma nova parceria ou editar uma parceria vigente
			Gostaria de conseguir acessar um sistema com as minhas credenciais
			Para conseguir registrar ou editar todas as informações sobre um parceiro ou parceria

	@logar
		Scenario: Logar no Sistema de Parcerias
			Given que acesso o url do sistema de parcerias
				And visualizo a tela de login
			When informo um usuario valido
				And a senha valida
				And clico em login
			Then acesso o sitema de parcerias
				And visualiso os dados do meu usuario logado
				And clico em Logout

	@logarSemPermissao
		Scenario: Tentar Logar no Sistema de Parcerias com usuario sem permissão de acesso
			Given que acesso o url do sistema de parcerias
				And visualizo a tela de login
			When informo um o usuario "Teste" que não possui permissão de acesso
				And a senha "senha" deste usuario
				And clico em login
			Then vejo a mensagem "Verifique o usuário e senha."