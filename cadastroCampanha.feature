#language: pt-br
@javascript

Feature: Criação de Campanha

	Quando vou fechar uma parceria de desconto
	Gostaria de criar uma campanha utilizando voucherd	Para oferecer desconto aos candidatos

	@cadastraCampanhaEmAndamento
		Scenario: Cadastrar Campanha Em andamento
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus' para o parceiro
				And informo o nome 'Campanha de Teste Em Andamento' para campanha
				And infomor o Layout da Campanha
				And informo uma data atual para inicio da campanha
				And informo a data '01/06/2030' para validade da campanha
				And seleciono o Tipo da Campanha 'Desconto com voucher'
				And seleciono o Grupo 'Teste de Plado oferencendo desconto com Voucher' de plano para Campanha
				And informo que a campanha 'Não' terá repasse
				And seleciono o plano 'Mensal' que será exibido na Tela do Seguro
				And seleciono o plano 'Trimestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Semestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Anual' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste Em Andamento cadastrada com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Cancelar a geração do Voucher
				And clico em Logout

	@cadastraCampanhaAgendada
		Scenario: Cadastrar Campanha Agendada
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus' para o parceiro
				And informo o nome 'Campanha de Teste Agendada' para campanha
				And infomor o Layout da Campanha
				And informo a data '01/06/2030' para inicio da campanha
				And informo a data '15/01/2038' para validade da campanha
				And seleciono o Tipo da Campanha 'Desconto com voucher'
				And seleciono o Grupo 'Teste de Plado oferencendo desconto com Voucher' de plano para Campanha
				And informo que a campanha 'Não' terá repasse
				And seleciono o plano 'Mensal' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste Agendada cadastrada com Sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Cancelar a geração do Voucher
				And clico em Logout

	@validandoCampos
		Scenario: Cadastrar Campanha para Validar os campos Nome da Campanha e Datas
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus' para o parceiro
				And informo o nome 'Campanha de Teste Agendada' para campanha
				And informo uma data atual para inicio da campanha
				And informo uma data atual para validade da campanha
				And seleciono o Tipo da Campanha 'Desconto com voucher'
				And seleciono o Grupo 'Teste de Plado oferencendo desconto com Voucher' de plano para Campanha
				And informo que a campanha 'Sim' terá repasse
				And seleciono o plano 'Trimestral Combo' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campo Nome da Campanha já está sendo utilizado.'
				And visualizo a mensagem 'Campo Data Fim precisa ser maior que a Data Inicio.'
				And visualizo a mensagem 'Campo Layout precisa de todos os dados válidos.'
				And clico no OK para fechar a Mensagem
				And clico em Logout

	@cadastraCampanhaAgendadaParaSerDesativar
		Scenario: Cadastrar Campanha para ser desativada
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus' para o parceiro
				And informo o nome 'Campanha de Teste a ser Desativada' para campanha
				And infomor o Layout da Campanha
				And informo a data '01/06/2030' para inicio da campanha
				And informo a data '15/01/2038' para validade da campanha
				And seleciono o Tipo da Campanha 'Desconto com voucher'
				And seleciono o Grupo 'Teste de Plado oferencendo desconto com Voucher' de plano para Campanha
				And informo que a campanha 'Não' terá repasse
				And seleciono o plano 'Trimestral Combo' que será exibido na Tela do Seguro
				And seleciono o plano 'Semestral Combo' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste a ser Desativada cadastrada com Sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Cancelar a geração do Voucher
				And clico em Logout

	@alterandoCampanhaParaDesativada
		Scenario: Editar Campanha agendada e desativando a Campanha
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
				And clico no campo de pesquisa
				And informo a campanha 'Campanha de Teste a ser Desativada'
				And seleciono o Status 'Agendada'
			When vejo 'Campanha' 'Campanha de Teste a ser Desativada' na lista
				And clico na campanha 'Campanha de Teste a ser Desativada'
				And visualizo o cadastro da Campanha 'Campanha de Teste a ser Desativada'
				And informo o nome 'Campanha de Teste Desativada' para campanha
				And altero o status da Campanha para 'Inativo'
				And clico em Salvar a Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste Desativada editada com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico no campo de pesquisa
				And informo a campanha 'Campanha de Teste Desativada'
				And seleciono o Status 'Desativada'
				And visualizo a campanha cadastrada com status 'Desativada'
				And clico em Logout

	@cadastraCampanhaEncerrada
		Scenario: Cadastrar Campanha para ser desativada
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus' para o parceiro
				And informo o nome 'Campanha de Teste Encerrada' para campanha
				And infomor o Layout da Campanha
				And informo a data '01/03/2016' para inicio da campanha
				And informo a data '01/04/2016' para validade da campanha
				And seleciono o Tipo da Campanha 'Desconto com voucher'
				And seleciono o Grupo 'Teste de Plado oferencendo desconto com Voucher' de plano para Campanha
				And informo que a campanha 'Não' terá repasse
				And seleciono o plano 'Anual' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste Encerrada cadastrada com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Logout

	@editarCampanhaEmAndamento
		Scenario: Tentar Editar Campanha Desativada
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
				And clico no campo de pesquisa
				And informo a campanha 'Campanha de Teste Em Andamento'
			When vejo 'Campanha' 'Campanha de Teste Em Andamento' na lista
				And clico na campanha 'Campanha de Teste Em Andamento'
			Then visualizo o cadastro da Campanha 'Campanha de Teste Em Andamento'
				And valido o campo 'Parceiro' esta bloqueado para alteração
				And valido o campo 'Descricao' esta bloqueado para alteração
				And valido o campo 'CKOrigem' esta bloqueado para alteração
				And valido o campo 'URL' esta bloqueado para alteração
				And valido o campo 'dataInicio' esta bloqueado para alteração
				And valido o campo 'dataFim' esta desbloqueada para alteração
				And valido o campo 'Status' esta desbloqueada para alteração
				And valido o campo 'TipoCampanha' esta bloqueado para alteração
				And valido o campo 'GrupoFlexPrice' esta bloqueado para alteração
				And valido o campo 'Repasse' esta bloqueado para alteração
				And valido o campo 'Mensal' esta bloqueado para alteração
				And valido o campo 'Trimestral' esta bloqueado para alteração
				And valido o campo 'Trimestral Combo' esta bloqueado para alteração
				And valido o campo 'Semestral' esta bloqueado para alteração
				And valido o campo 'Semestral Combo' esta bloqueado para alteração
				And valido o campo 'Anual' esta bloqueado para alteração
				And clico em Cancelar a Campanhas
				And clico em Continuar o Cancelamento das alterações
				And clico em Logout

	@cadastraCampanhaEmAndamentoTodosPlanos
		Scenario: Cadastrar Campanha Em andamento
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus' para o parceiro
				And informo o nome 'Campanha de Teste com Todos os Planos' para campanha
				And infomor o Layout da Campanha
				And informo uma data atual para inicio da campanha
				And informo a data '01/06/2030' para validade da campanha
				And seleciono o Tipo da Campanha 'Desconto com voucher'
				And seleciono o Grupo 'Teste de Plado oferencendo desconto com Voucher' de plano para Campanha
				And informo que a campanha 'Sim' terá repasse
				And seleciono o plano 'Mensal' que será exibido na Tela do Seguro
				And seleciono o plano 'Trimestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Trimestral Combo' que será exibido na Tela do Seguro
				And seleciono o plano 'Semestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Semestral Combo' que será exibido na Tela do Seguro
				And seleciono o plano 'Anual' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste com Todos os Planos cadastrada com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Cancelar a geração do Voucher
				And clico em Logout

	@cadastraCampanhaTemplate
		Scenario: Cadastrar Campanha em Andamento
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
				And clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus' para o parceiro
				And informo o nome 'Campanha de Teste Template' para campanha
				And clico em Editar Layout
			When Vejo a tela para editar Layout da Campanha
				And seleciono o logo do parceiro
				And informo o titulo 'Campanha de Teste Template' para a campanha
				And informo a frase de Icentivo 'Frase para Campanha Maximo de 255 Cadacteres' para a campanha
				And informo o codigo hehadecial '#37bb64' para a cor Predominante
				And clico na pŕe visualização do Seguro
				And visualizo o Seguro
				And clico em OK
				And informo uma data atual para inicio da campanha
				And informo a data '01/06/2030' para validade da campanha
				And seleciono o Tipo da Campanha 'Desconto com voucher'
				And seleciono o Grupo 'Teste de Plado oferencendo desconto com Voucher' de plano para Campanha
				And informo que a campanha 'Não' terá repasse
				And seleciono o plano 'Mensal' que será exibido na Tela do Seguro
				And seleciono o plano 'Trimestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Semestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Anual' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste Template cadastrada com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Cancelar a geração do Voucher
				And clico em Logout

	@cadastraCampanhaComFiliais
		Scenario: Cadastrar Campanha Em andamento
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus Filiais' para o parceiro
				And informo o nome 'Campanha de Teste com Filiais' para campanha
				And infomor o Layout da Campanha
				And informo uma data atual para inicio da campanha
				And informo a data '01/06/2030' para validade da campanha
				And seleciono o Tipo da Campanha 'Desconto com voucher'
				And seleciono o Grupo 'Teste de Plado oferencendo desconto com Voucher' de plano para Campanha
				And informo que a campanha 'Sim' terá repasse
				And seleciono o plano 'Trimestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Semestral' que será exibido na Tela do Seguro
				And seleciono o plano 'Anual' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste com Filiais cadastrada com sucesso!'
				And clico no OK para fechar a Mensagem
				And informo a quantidade de Vouchers
				And seleciono a opção Gerar para todas as filiais
				And clico em gerar
				And visualizo a mensagem 'Vouchers gerados com sucesso.'
				And clico no OK para fechar a Mensagem
				And Visualizo o lote 'lote1' Gerado para a 'Filial_01'
				And Visualizo o lote 'lote2' Gerado para a 'Filial_03'
				And clico em Downlod para baixar o lote
				And clico em Logout

	@gerarVoucher
		Scenario: Tentar Editar Campanha Desativada
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
				And clico no campo de pesquisa
				And informo a campanha 'Campanha de Teste com Filiais'
			When vejo 'Campanha' 'Campanha de Teste com Filiais' na lista
				And clico na campanha 'Campanha de Teste com Filiais'
			Then visualizo o cadastro da Campanha 'Campanha de Teste com Filiais'
				And visualizo a opção de Gerar Lotes
				And clico no botao Gerar Lote
				And informo a quantidade de Vouchers
				And seleciono a 'Filial 03'
				And clico em gerar
				And visualizo a mensagem 'Vouchers gerados com sucesso.'
				And clico no OK para fechar a Mensagem
				And Visualizo o lote 'lote3' Gerado para a 'Filial_03'
				And clico em Downlod para baixar o lote
				And clico em Logout

	@cadastraCampanhaComPreçoZeroNoPlano
		Scenario: Cadastrar Campanha Em andamento
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Campanhas'
			When clico em incluir 'Nova Campanha'
				And clico no campo para informar o parceiro
				And informo o nome 'Time Spartacus Filiais' para o parceiro
				And informo o nome 'Campanha de Teste com Preço Zero' para campanha
				And clico em Editar Layout
			When Vejo a tela para editar Layout da Campanha
				And seleciono o logo do parceiro
				And informo o titulo 'Campanha Preço Zero' para a campanha
				And informo a frase de Icentivo 'Assinatura GRÁTIS' para a campanha
				And informo o codigo hehadecial '#c42b65' para a cor Predominante
				And clico na pŕe visualização do Seguro
				And visualizo o Seguro
				And clico em OK
				And informo uma data atual para inicio da campanha
				And informo a data '01/06/2030' para validade da campanha
				And seleciono o Tipo da Campanha 'Primeira vigência grátis com voucher'
				And seleciono o Grupo 'teste 1ª vigencia gratis' de plano para Campanha
				And informo que a campanha 'Sim' terá repasse
				And seleciono o plano 'Mensal' que será exibido na Tela do Seguro
				And clico em Criar Campanha
			Then visualizo a mensagem 'Campanha Campanha de Teste com Preço Zero cadastrada com sucesso!'
				And clico no OK para fechar a Mensagem
				And informo a quantidade de Vouchers
				And seleciono a 'Filial 01'
				And clico em gerar
				And visualizo a mensagem 'Vouchers gerados com sucesso.'
				And clico no OK para fechar a Mensagem
				And Visualizo o lote 'lote1' Gerado para a 'Filial_01'
				And clico em Logout