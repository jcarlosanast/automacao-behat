#language: pt-br
@javascript

Feature: Pesquisa de Campanha

	Quando vou criar uma nova campanha
			Gostaria de saber quais são os parceiros que estão ativos
			Para não duplicar o registro de parceiros na base de dados

	@cPesquisaEmAndamento
		Scenario: Pesquisar Campanha que estão em Andamento (Ativas)
			Given que estou logado no sistema de parcerias
			When clico no menu em 'Campanhas'
	 			And clico no campo de pesquisa
	 			And informo a campanha "Campanha de Teste Em Andamento"
			Then vejo "Campanha" "Campanha de Teste Em Andamento" na lista
				And visualizo a campanha cadastrada com status "Em Andamento"
				And clico em Logout

	@cPesquisaAgendadas
		Scenario: Pesquisar Campanha que estão Agendadas (Ativas)
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
	 			And clico no campo de pesquisa
	            And informo a campanha "Campanha de Teste Agendada"
	        When vejo a mensagem da tela de pesquisa "Nenhum registro encontrado."
			    And seleciono o Status "Agendada"
			Then vejo "Campanha" "Campanha de Teste Agendada" na lista
				And visualizo a campanha cadastrada com status "Agendada"
				And clico em Logout

	@cPesquisaDesativadas
		Scenario: Pesquisar Campanha que estão Desativadas (Inativa)
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
	 			And clico no campo de pesquisa
	            And informo a campanha "Campanha de Teste Desativada"
	        When vejo a mensagem da tela de pesquisa "Nenhum registro encontrado."
			    And seleciono o Status "Desativada"
			Then vejo "Campanha" "Campanha de Teste Desativada" na lista
				And visualizo a campanha cadastrada com status "Desativada"
				And clico em Logout

	@cPesquisaEncerrada
		Scenario: Pesquisar Campanha que estão Encerradas (Inativa)
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
	 			And clico no campo de pesquisa
	 			And seleciono o Status "Encerrada"
			Then vejo "Campanha" "Campanha de Teste Encerrada" na lista
				And visualizo a campanha cadastrada com status "Encerrada"
				And clico em Logout

	@cPesquisaTodos
		Scenario: Pesquisar Campanha que estão Encerradas (Inativa)
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
	 			And clico no campo de pesquisa
	 			And seleciono o Status "Todos"
			Then visualizo a campanha cadastrada com status "Em Andamento"
				And visualizo a campanha cadastrada com status "Agendada"
				And visualizo a campanha cadastrada com status "Encerrada"
				And visualizo a campanha cadastrada com status "Desativada"
				And clico em Logout