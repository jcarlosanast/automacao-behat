#language: pt-br
@javascript

Feature: Cadastro do Parceiro

	Quando vou fechar uma parceria com um novo parceiro
			Gostaria de cadastrar as informações do novo parceiro
			Para conseguir cadastrar a campanha

	@cadastraParceiro
		Scenario: Cadastrar um Parceiro
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
			When clico em incluir 'Novo Parceiro'
				And informo o nome 'Time Spartacus'
				And informo a origem 'SP1'
				And informo o HotSite 'Spartacus'
				And informo o nome 'Spartacus' para o contato
				And informo o email 'spartacus@teste.uk' do contato
				And informo o login 'spartacus' e acesso para o parceiro
				And informo a senha '654654654' para o usuario
				And informo que o Parceiro 'Não' Possui filiais
				And clico em criar parceiro
			Then visualizo a mensagem 'Parceiro Time Spartacus cadastrado com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Logout

	@contatosParceiro
		Scenario: Cadastrar um Parceiro Editando Contatos
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
			When clico em incluir 'Novo Parceiro'
				And informo o nome 'Time Spartacus 2'
				And informo a origem 'SP2'
				And informo o HotSite 'Spartacus2'
				And informo o nome 'Spartacus2' para o contato
				And informo o email 'spartacus2@teste.uk' do contato
				And clico no botao Adicionar Contato
				And informo o nome 'Spartacus3' para o contato dois
				And informo o email 'spartacus3@teste.uk' do contato dois
				And clico no botao Adicionar Contato
				And informo o nome 'Spartacus4' para o contato três
				And informo o email 'spartacus4@teste.uk' do contato três
				And clico no botão Excluir Contato para remover o contato tres
				And informo o login 'spartacus2' e acesso para o parceiro
				And informo a senha '654654654' para o usuario
				And informo que o Parceiro 'Não' Possui filiais
				And clico em criar parceiro
			Then visualizo a mensagem 'Parceiro Time Spartacus 2 cadastrado com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Logout

	@cadastraParceiroAserDesativado
		Scenario: Cadastrar um Parceiro para ser Desativado
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
			When clico em incluir 'Novo Parceiro'
				And informo o nome 'Time Spartacus 3'
				And informo a origem 'SP3'
				And informo o HotSite 'Spartacus'
				And informo o nome 'Spartacus5' para o contato
				And informo o email 'spartacus5@teste.uk' do contato
				And informo o login 'spartacus5' e acesso para o parceiro
				And informo a senha '654654654' para o usuario
				And informo que o Parceiro 'Não' Possui filiais
				And clico em criar parceiro
			Then visualizo a mensagem 'Parceiro Time Spartacus 3 cadastrado com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Logout

	@editaParceiro
		Scenario: Editar Parceiro Ativo alterando para desativado.
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
				And clico no campo de pesquisa
				And informo o parceiro 'Time Spartacus 3'
			When vejo 'Parceiro' 'Time Spartacus 3' na lista
				And clico no parceiro "Time Spartacus 3"
				And visualizo o cadastro do parceiro
				And informo o nome 'Time Spartacus Inativo'
				And altero o status do Parceiro para 'Inativo'
				And informo um novo email 'parceirodesativado@teste.uk'
				And clico em Salvar Parceiro
			Then visualizo a mensagem 'Parceiro Time Spartacus Inativo editado com sucesso!'
				And clico no OK para fechar a Mensagem
				And visualizo o parceiro com status 'Inativo'
		 		And clico em Logout

	@validarCampos
		Scenario: Cadastrar um Parceiro Validando os campos de origem e login
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
			When clico em incluir 'Novo Parceiro'
				And informo o nome 'Time Spartacus'
				And informo a origem 'SP1'
				And informo o HotSite 'Spartacus'
				And informo o nome 'Spartacus' para o contato
				And informo o email 'spartacus@teste.uk' do contato
				And informo o login 'spartacus' e acesso para o parceiro
				And informo a senha '654654654' para o usuario
				And informo que o Parceiro 'Não' Possui filiais
				And clico em criar parceiro
			Then visualizo a mensagem 'Este nome já está sendo utilizado.'
				And visualizo a mensagem 'Este nome já está sendo utilizado.'
				And visualizo a mensagem 'Este login já está sendo utilizado.'
				And clico no OK para fechar a Mensagem
				And clico em Logout

	@cadastrafiliaisParceiro
		Scenario: Cadastrar Filiais do Parceiro
			Given que estou logado no sistema de parcerias
				And clico no menu em 'Parceiros'
			When clico em incluir 'Novo Parceiro'
				And informo o nome 'Time Spartacus Filiais'
				And informo a origem 'SP4'
				And informo o HotSite 'Spartacusfiliais'
				And informo o nome 'Spartacus6' para o contato
				And informo o email 'spartacus6@teste.uk' do contato
				And informo o login 'spartacus6' e acesso para o parceiro
				And informo a senha '654654654' para o usuario
				And informo que o Parceiro 'Sim' Possui filiais
				And informo o nome 'Filial 01' da Filial '1'
				And clico em Adicionar Filial
				And informo o nome 'Filial 02' da Filial '2'
				And clico em Adicionar Filial
				And informo o nome 'Filial 03' da Filial '3'
				And clico em Excluir Filial '2'
				And clico em criar parceiro
			Then visualizo a mensagem 'Parceiro Time Spartacus Filiais cadastrado com sucesso!'
				And clico no OK para fechar a Mensagem
				And clico em Logout