	  #language: pt-br
@javascript

Feature: Relatorios

	Quando Para conseguir saber se as campanhas de parcerias estão funcionando,
			gostaria de saber quais os resultados em inclusões e vendas para decidir
			se alguma ação precisa ser tomada.

	@relGerais
		Scenario: Relatorio Gerais de Campanha
			Given que estou logado no sistema de parcerias
				And clico no menu em Relatorios "Geral"
			When visualizo o 'Relatório geral'
				And informo a data '01/06/2016' para inicio da campanha
				And informo a data '01/07/2016' para validade da campanha
				And processo os dados
		    Then visualizo os dados do "Consolidado" gerados
		    	And visualizo os dados do "Vendas" gerados
		    	And visualizo os dados de "Inclusões" "1" gerados
		    	And visualizo os dados de "Vendido" "299,40" gerados
		    	And visualizo os dados de "Ticket Médio" "299,40" gerados
				And visualizo os dados de "Faturado" "0,00" gerados
				And visualizo os dados de "Desconto" "0,00" gerados
				And clico para visualizar o planos
		    	And visualizo os dados do "Time Spartacus Filiais" gerados
		    	And visualizo as campanhas "Campanha de Teste com Filiais" geradas para o parceiro
				And clico em Logout

	@relParceiros
		Scenario: Relatorio de Resultados do Parceiro na Campanha
			Given que estou logado no sistema de parcerias
				And clico no menu em Relatorios "Por parceiro"
			When visualizo o 'Relatórios por parceiro'
				And clico no campo para informar o parceiro da campanha
				And informo o nome "Time Spartacus Filiais" para o parceiro
				And informo a data '01/05/2016' para inicio da campanha
				And informo a data '01/07/2016' para validade da campanha
				And processo os dados
		    Then visualizo os dados do "Time Spartacus Filiais" gerados
		    	And visualizo as campanhas "Campanha de Teste com Filiais" geradas para o parceiro
		    	And visualizo os dados do "Vendas" gerados
		    	And visualizo os dados de "Inclusões" "1" gerados
		    	And visualizo os dados de "Vendido" "299,40" gerados
		    	And visualizo os dados de "Ticket Médio" "299,40" gerados
				And visualizo os dados de "Faturado" "0,00" gerados
				And visualizo os dados de "Desconto" "0,00" gerados
		    	And visualizo os dados do "Trimestral" gerados
		    	And clico para visualizar mais planos
		    	And visualizo os dados do "Semestral" gerados
		    	And visualizo os dados de "Com voucher" "Inclusões" "1" gerados
		    	And visualizo os dados de "Com voucher" "Vendido" "299,40" gerados
		    	And visualizo os dados de "Com voucher" "Ticke Médio" "299,40" gerados
				And visualizo os dados de "Com voucher" "Faturado" "0,00" gerados
				And visualizo os dados de "Com voucher" "Desconto" "0,00" gerados
		    	And visualizo os dados de "Sem Voucher" "Inclusões" "0" gerados
  			    And visualizo os dados de "Sem voucher" "Vendido" "299,40" gerados
		    	And visualizo os dados de "Sem voucher" "Ticke Médio" "299,40" gerados
				And visualizo os dados de "Sem voucher" "Faturado" "0,00" gerados
				And visualizo os dados de "Sem voucher" "Desconto" "0,00" gerados
		    	And visualizo os dados do "Total" gerados
		    	And visualizo os dados do "Anual" gerados
				And clico em Logout

	@relCampanha
		Scenario: Relatorio de Resultados da Campanha
			Given que estou logado no sistema de parcerias
				And clico no menu em Relatorios "Por campanhas"
			When visualizo o 'Relatórios por campanha'
				And clico no campo para informar a campanha
				And informo o nome "Campanha de Teste com Filiais" da campanha
				And informo a data '01/05/2016' para inicio da campanha
				And informo a data '01/07/2016' para validade da campanha
				And processo os dados
		    Then visualizo as campanhas "Campanha de Teste com Filiais" geradas para o parceiro
		    	And visualizo os dados do "Vendas" gerados
		    	And visualizo os dados de "Inclusões" "1" gerados
		    	And visualizo os dados de "Vendido" "299,40" gerados
		    	And visualizo os dados de "Ticket Médio" "299,40" gerados
				And visualizo os dados de "Faturado" "0,00" gerados
				And visualizo os dados de "Desconto" "0,00" gerados
		    	And visualizo os dados do "Trimestral" gerados
		    	And clico para visualizar mais planos
		    	And visualizo os dados do "Semestral" gerados
		    	And visualizo os dados de "Com voucher" "Inclusões" "1" gerados
		    	And visualizo os dados de "Com voucher" "Vendido" "299,40" gerados
		    	And visualizo os dados de "Com voucher" "Ticke Médio" "299,40" gerados
				And visualizo os dados de "Com voucher" "Faturado" "0,00" gerados
				And visualizo os dados de "Com voucher" "Desconto" "0,00" gerados
		    	And visualizo os dados de "Sem Voucher" "Inclusões" "0" gerados
  			    And visualizo os dados de "Sem voucher" "Vendido" "299,40" gerados
		    	And visualizo os dados de "Sem voucher" "Ticke Médio" "299,40" gerados
				And visualizo os dados de "Sem voucher" "Faturado" "0,00" gerados
				And visualizo os dados de "Sem voucher" "Desconto" "0,00" gerados
				And visualizo os dados do "Total" gerados
		    	And visualizo os dados do "Anual" gerados
				And clico em Logout

	@exportacao
		Scenario: Relatorio Gerais de Campanha
			Given que estou logado no sistema de parcerias
				And clico no menu em Relatorios "Geral"
			When visualizo o 'Relatório geral'
				And informo a data '01/06/2016' para inicio da campanha
				And informo a data '01/07/2016' para validade da campanha
				And processo os dados
			Then clico em Exportação Dados
				And clico em Logout