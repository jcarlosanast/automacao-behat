#language: pt-br
@javascript

Feature: Pesquisa de Parceiros

	Quando vou criar uma nova campanha
			Gostaria de saber quais são os parceiros que estão ativos
			Para não duplicar o registro de parceiros na base de dados

	@pPesquisaAtivos
		Scenario: Pesquisar Parceiros Ativo
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
				And seleciono o Status "Inativo"
				And clico no campo de pesquisa
				And informo o parceiro "Administradores"
			When vejo a mensagem da tela de pesquisa "Nenhum registro encontrado."
				And seleciono o Status Ativo
			Then vejo "Parceiro" "Administradores" na lista
				And clico em Logout

	@pPesquisaInativo
		Scenario: Pesquisar Parceiros Inativo
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
				And clico no campo de pesquisa
				And informo o parceiro "Time Spartacus Inativo"
			When vejo a mensagem da tela de pesquisa "Nenhum registro encontrado."
				And seleciono o Status "Inativo"
			Then vejo "Parceiro" "Time Spartacus" na lista
				And clico em Logout

	@pPesquisaTodos
		Scenario: Pesquisar Todos os Parceiros
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
			When seleciono o Status "Todos"
				And clico no campo de pesquisa
			Then visualizo as paginas com todos os Parceiros cadastrados
				And clico em Logout

	@editarParceiroNaPesquisa
		Scenario: Pesquisar Parceiros na paginação
			Given que estou logado no sistema de parcerias
				And clico no menu em "Parceiros"
				And seleciono o Status "Todos"
			When visualizo os parceiros na pagina de pesquisa
				And vejo "Parceiro" "Agência SEO" na lista
				And clico no campo de pesquisa
				And informo o parceiro "Agência SEO"
				And clico no parceiro "Agência SEO"
			Then visualizo o cadastro do parceiro
				And clico em Cancelar Parceiro
				And clico em Continuar o Cancelamento das alterações
				And clico em Logout