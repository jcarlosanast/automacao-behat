<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\MinkExtension\Context\MinkContext;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends MinkContext implements Context, SnippetAcceptingContext
{
    private $xPathCamposCampanha = [
        'Parceiro'         => '//*[@id="campaign-fields"]/div/div[1]/div[2]/div[1]/select',
        'Descricao'        => '//*[@id="campaign-fields"]/div/div[2]/div[2]/div/label/input',
        'CKOrigem'         => '//*[@id="campaign-fields"]/div/div[2]/div[3]/div/label/div/span/input',
        'URL'              => '//*[@id="campaign-fields"]/div/div[2]/div[4]/div[1]/label/div/span/input',
        'Status'           => '//*[@id="campaign-fields"]/div/div[2]/div[6]/div/label/select',
        'TipoCampanha'     => '//*[@id="tipo"]',
        'dataInicio'       => '//*[@id="dataInicio"]',
        'dataFim'          => '//*[@id="dataFim"]',
        'GrupoFlexPrice'   => '//*[@id="voucher-type"]/div/div/div[1]/div[2]/label/select',
        'Repasse'          => '//*[@id="voucher-type"]/div/div/div[1]/div[3]/label/select',
        'Mensal'           => '//*[@id="voucher-type"]/div/div/div[2]/div/label[1]/input',
        'Trimestral'       => '//*[@id="voucher-type"]/div/div/div[2]/div/label[2]/input',
        'Trimestral Combo' => '//*[@id="voucher-type"]/div/div/div[2]/div/label[3]/input',
        'Semestral'        => '//*[@id="voucher-type"]/div/div/div[2]/div/label[4]/input',
        'Semestral Combo'  => '//*[@id="voucher-type"]/div/div/div[2]/div/label[5]/input',
        'Anual'            => '//*[@id="voucher-type"]/div/div/div[2]/div/label[6]/input'
    ];

    private $xPathGrupoPlanos = [
        'Primeiro'  => '//*[@id="voucher-type"]/div/div/div[1]/div[2]/label/select/option[2]',
        'Segundo'   => '//*[@id="voucher-type"]/div/div/div[1]/div[2]/label/select/option[3]',
        'Terceiro'  => '//*[@id="voucher-type"]/div/div/div[1]/div[2]/label/select/option[4]',
        'Quarto'    => '//*[@id="voucher-type"]/div/div/div[1]/div[2]/label/select/option[5]',
    ];

    private $host    = 'svnow.devel';
    private $usuario = 'admin';
    private $senha   = 'admin';

    /*Método para verificar se dentro do xPath existe o texto desejado*/
    public function validaTextoNoXpath($xPath,$texto)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find('xpath',$xPath);

        if ($texto != $element->getText()) {
            throw new \InvalidArgumentException(sprintf("Texto '{$texto}' não encontrado no Xpath"));
        }
    }

    /*Método para clicar em um xpath*/
    public function xpathClick($xpath)
    {
        $this->getSession()->getPage()->find(
        'xpath',
        $this->getSession()->getSelectorsHandler()->selectorToXpath('xpath',$xpath)
        )->click();
    }

    /*Método para verificar uma informação dentro de um xpath*/
    public function validaDadoNoXPath($xpath)
    {
        $page = $this->getSession()->getPage();
        $temp = $page->find('xpath', '//div[@id="myid"]//div[@class="myclass"]//p[text()=$xpath]');
    }

    /*Método para procurar um atributo dentro de um xpath e retornar falha no teste quando não identificado*/
    public function validaCampoSomenteLeitura($nomeElemento,$xPath)
    {
        $verificaAtributo = $this->getSession()->getPage()->find(
        'xpath',
        $this->getSession()->getSelectorsHandler()->selectorToXpath('xpath',$xPath)
        )->getAttribute($nomeElemento);

        if ($verificaAtributo != $nomeElemento){
            throw new \Exception("Campo {$campo} esta bloqueado");
        }
    }

    /*Método para procurar um atributo dentro de um xpath e retornar falha no teste quando identificado*/
    public function validaCampoDesbloqueado($nomeElemento,$xPath)
    {
        $verificaAtributo = $this->getSession()->getPage()->find(
        'xpath',
        $this->getSession()->getSelectorsHandler()->selectorToXpath('xpath',$xPath)
        )->getAttribute($nomeElemento);

        if ($verificaAtributo == $nomeElemento){
            throw new \Exception('Campo {$campo} não esta desbloqueado');
        }
    }

    /**
     * @Given que acesso o url do sistema de parcerias
     */
    public function queAcessoODoSistemaDeParcerias()
    {
        $this->getSession()->visit("http://adparcerias.". $this->host ."/");
        $this->getSession()->getDriver()->maximizeWindow();
    }

    /**
     * @Given visualizo a tela de login
     */
    public function visualizoATelaDe()
    {
        $this->assertPageContainsText('Sistema de Parcerias');
    }

    /**
     * @When informo um o usuario :arg1 que não possui permissão de acesso
     */
    public function informoUmOUsuarioQueNaoPossuiPermissaoDeAcesso($usuario)
    {
        $this->fillField("Usuário", $usuario);
    }

    /**
     * @When a senha :arg1 deste usuario
     */
    public function aSenhaDesteUsuario($senha)
    {
        $this->fillField("Senha",$senha);
    }

    /**
     * @Then vejo a mensagem :arg1
     */
    public function vejoAMensagem($mensagem1)
    {
        $this->assertPageContainsText($mensagem1);
        $this->getSession()->wait(2000);
    }

    /**
     * @When informo um usuario valido
     */
    public function informoUmUsuarioValido()
    {
        $this->fillField("Usuário", $this->usuario);
    }

    /**
     * @When a senha valida
     */
    public function aSenhaValida()
    {
        $this->fillField("Senha",$this->senha);
    }

    /**
     * @When clico em login
     */
    public function clicoEmLogin()
    {
        $this->getSession()->wait(2000);
        $this->pressButton("Login");
    }

    /**
     * @Then acesso o sitema de parcerias
     */
    public function acessoOSitemaDeParcerias()
    {
        $this->assertPageContainsText('Sistema de Parcerias');
    }

    /**
     * @Then visualiso os dados do meu usuario logado
     */
    public function visualisoOsDadosDoMeuUsuarioLogado()
    {
        $this->assertPageContainsText($this->usuario);
    }

    /**
     * @Then clico em logout
     */
    public function clicoEmLogout()
    {
        $this->getSession()->wait(1000);
        $this->clickLink('admin');
        $this->clickLink('Logout');
    }

    /**
     * @Given clico no menu em :arg1
     */
    public function clicoNoMenuEm($itemMenu)
    {
        $this->clickLink($itemMenu);
    }

        /**
     * @When clico em incluir :arg1
     */
    public function clicoEmIncluir($novaCadastro)
    {
        $this->clickLink($novaCadastro);
    }

    /**
     * @When clico em incluir Nova Campanha
     */
    public function clicoEmIncluirCampanha()
    {
        $xpath = '//*[@id="main"]/div[1]/div[2]/a';
        $this->getSession()->getDriver()->doubleClick($xpath);

        // $this->getSession()->getDriver()->doubleClick($this->getXpath());
        // $this->clickLink($novaCadastro);
        // $this->xpathClick('//*[@id="main"]/div[1]/div[2]/a');
        // $this->getSession()->wait(30000);
    }

    /**
     * @When informo o nome :arg1
     */
    public function informoONome($parceiro)
    {
        $this->fillField("parceiro", $parceiro);
    }

    /**
     * @When informo a origem :arg1
     */
    public function informoAOrigem($origem)
    {
        $this->fillField("origem", $origem);
    }

    /**
     * @When informo o HotSite :arg1
     */
    public function informoOHotsite($hotsite)
    {
        $this->fillField("hotsite", $hotsite);
    }

    /**
     * @When informo o nome :arg1 para o contato
     */
    public function informoONomeParaOContato($parceiro)
    {
        $this->getSession()->getDriver()->setValue('//*[@id="partner-contacts"]/div/div/div[1]/div[2]/div[1]/label/input',$parceiro);
    }

    /**
     * @When informo o email :arg1 do contato
     */
    public function informoOEmailDoContato($email)
    {
        $this->getSession()->getDriver()->setValue('//*[@id="partner-contacts"]/div/div/div[1]/div[2]/div[2]/label/input', $email);
    }

    /**
     * @When informo o nome :arg1 para o contato dois
     */
    public function informoONomeParaOContatoDois($parceiro)
    {
        $this->getSession()->getDriver()->setValue('//*[@id="partner-contacts"]/div/div/div[2]/div[2]/div[1]/label/input',$parceiro);
    }

    /**
     * @When informo o email :arg1 do contato dois
     */
    public function informoOEmailDoContatoDois($email)
    {
        $this->getSession()->getDriver()->setValue('//*[@id="partner-contacts"]/div/div/div[2]/div[2]/div[2]/label/input', $email);
    }

    /**
     * @When informo o nome :arg1 para o contato três
     */
    public function informoONomeParaOContatoTres($parceiro)
    {
         $this->getSession()->getDriver()->setValue('//*[@id="partner-contacts"]/div/div/div[3]/div[2]/div[1]/label/input',$parceiro);
    }

    /**
     * @When informo o email :arg1 do contato três
     */
    public function informoOEmailDoContatoTres($email)
    {
        $this->getSession()->getDriver()->setValue('//*[@id="partner-contacts"]/div/div/div[3]/div[2]/div[2]/label/input', $email);
    }

    /**
     * @When informo o login :arg1 e acesso para o parceiro
     */
    public function informoOLoginEAcessoParaOParceiro($login)
    {
        $this->fillField("login", $login);
    }

    /**
     * @When informo a senha :arg1 para o usuario
     */
    public function informoASenhaParaOUsuario($senha)
    {
        $this->fillField("senha", $senha);
        $this->getSession()->wait(2000);
    }

    /**
     * @When visualizo o cadastro do parceiro
     */
    public function visualizoOCadastroDoParceiro()
    {
        $this->validaDadoNoXPath("spartacus2@spartacus.uk");
    }

    /**
     * @When informo um novo email :arg1
     */
    public function informoUmNovoEmail($mail)
    {
        $this->xpathClick('//*[@id="partner-contacts"]/div/div/div[1]/div[2]/div[2]/label/input');
        $this->getSession()->getDriver()->setValue('//*[@id="partner-contacts"]/div/div/div[1]/div[2]/div[2]/label/input', $mail);
        $js = "$('html, body').animate({scrollTop: $('[type=submit]').offset().top}, 500)";
        $this->getSession()->executeScript($js);
    }

    /**
     * @Then visualizo o parceiro com status :arg1
     */
    public function visualizoOParceiroComStatus($status)
    {
        $this->clicoNoCampoDePesquisa();
        $this->informoOParceiro('Time Spartacus 3');
        $this->selecionoOStatus('Inativo');
        $this->assertPageContainsText($status);
    }

    /**
     * @Then visualizo o novo e-mail informado no Contato
     */
    public function visualizoONovoEMailInformadoNoContato()
    {
        $this->validaDadoNoXPath("spartacus2@spartacus.uk");
    }

    /**
     * @When informo que o Parceiro :arg1 Possui filiais
     */
    public function informoQueOParceiroPossuiFiliais($filiais)
    {
        $this->selectOption("possuiFiliais", $filiais);
    }

    /**
     * @When informo o nome :arg1 da Filial :arg2
     */
    public function informoONomeDaFilial($nomeFilial, $filial)
    {
        $this->getSession()->getDriver()->setValue('//*[@id="data-filial"]/div/div/div[3]/div['.$filial.']/div[2]/div/label/input',$nomeFilial);

        $js = "$('html, body').animate({scrollTop: $('[type=submit]').offset().top}, 500)";
        $this->getSession()->executeScript($js);
    }

    /**
     * @When clico em Adicionar Filial
     */
    public function clicoEmAdicionarFilial()
    {
        $this->getSession()->getPage()->findById("btnAddFil")->click();
    }

    /**
     * @When clico em Excluir Filial :arg1
     */
    public function clicoEmExcluirFilial($filial)
    {
        $this->xpathClick('//*[@id="data-filial"]/div/div/div[3]/div['.$filial.']/div[2]/div[2]/span');
    }

    /**
     * @Then clico em Cancelar Parceiro
     */
    public function clicoEmCancelarParceiro()
    {
        $js = "$('html, body').animate({scrollTop: $('[type=submit]').offset().top}, 500)";
        $this->getSession()->executeScript($js);
        $this->getSession()->wait(1000);
        $this->xpathClick('//*[@id="editParceiro"]/div[3]/div/a');
    }

    /**
     * @Then clico em Salvar Parceiro
     */
    public function clicoEmSalvarParceiro()
    {
        $js = "$('html, body').animate({scrollTop: $('[type=submit]').offset().top}, 500)";
        $this->getSession()->executeScript($js);

        $this->getSession()->wait(2000);
        $this->xpathClick('//*[@id="editParceiro"]/div[3]/div/button');
    }

    /**
     * @Then clico em Salvar a Campanha
     */
    public function clicoEmSalvarACampanha()
    {
        $url = $this->getSession()->getCurrentUrl();
        $this->getSession()->visit($url."#comercial-model");
        $this->pressButton("Salvar");
    }

    /**
     * @Given Que estou logado no sistema de parcerias
     */
    public function queEstouLogadoNoSistemaDeParcerias()
    {
        $this->queAcessoODoSistemaDeParcerias();
        $this->visualizoATelaDe();
        $this->informoUmUsuarioValido($this->usuario);
        $this->aSenhaValida($this->senha);
        $this->clicoEmLogin();
    }

    /**
     * @Then clico no nome Time Spartacus
     */
    public function clicoNoNomeSpartacus()
    {
        $this->xpathClick('//*[@id="list-partners"]/div/table/tbody/tr[1]/td[1]/a');
    }

    /**
     * @Then visualizo a mensagem :arg1
     */
    public function visualizoAMensagem($mensagem2)
    {
        $this->getSession()->wait(3000);
        $this->assertPageContainsText($mensagem2);
    }

    /**
     * @Then visulizo o cadastro do parceiro
     */
    public function visulizoOCadastroDoParceiro()
    {
        $this->assertPageContainsText("Dados do Parceiro");
    }

    /**
     * @Then clico em Adicionar
     */
    public function clicoEmAdicionar()
    {
        $this->xpathClick('//*[@id="saveParceiro"]/div[2]/div[2]/button');
    }

    /**
     * @Then fecho a mensagem
     */
    public function fechoAMensagem()
    {
        $this->xpathClick('//*[@id="system-messages"]/button');
    }

    /**
     * @Then altero o status do Parceiro para :arg1
     */
    public function alteroOStatusDoParceiroPara($status)
    {
        $this->selectOption("status", $status);
    }

    /**
     * @Given clico no campo de pesquisa
     */
    public function clicoNoCampoDePesquisa()
    {
        $this->getSession()->wait(3000);
        $this->getSession()->getPage()->findById("pesquisa")->click();
    }

    /**
     * @Given seleciono o Status :arg1
     */
    public function selecionoOStatus($status)
    {
        $this->getSession()->wait(1000);
        $this->selectOption("status", $status);
        $this->getSession()->wait(5000);
    }

    /**
     * @When informo o parceiro :arg1
     */
    public function informoOParceiro($parceiro)
    {
        $this->fillField('pesquisa', $parceiro);
        $this->getSession()->wait(2000);
    }

    /**
     * @When vejo a mensagem da tela de pesquisa :arg1
     */
    public function vejoAMensagemDaTelaDePesquisa($mensagem)
    {
        $this->getSession()->wait(2500);
        $this->assertPageContainsText($mensagem);
    }

    /**
     * @Then visualizo as paginas com todos os Parceiros cadastrados
     */
    public function visualizoAsPaginasComTodosOsParceirosCadastrados()
    {
        $page = $this->getSession()->getPage();
        $temp = $page->find('xpath', '//div[@id="myid"]//div[@class="myclass"]//p[text()="75"]');
    }

    /**
     * @When visualizo os parceiros na pagina de pesquisa
     */
    public function visualizoOsParceirosNaPaginaDePesquisa()
    {
        $page = $this->getSession()->getPage();
        $temp = $page->find('xpath', '//div[@id="myid"]//div[@class="myclass"]//p[text()="ads"]');
    }

    /**
     * @When seleciono a paginação :arg1
     */
    public function selecionoAPaginacao($pagina)
    {
        $this->clickLink($pagina);
    }

    /**
     * @Then vejo :arg1 :arg2 na lista
     */
    public function vejoNaLista($tipo, $nome)
    {
        $this->getSession()->wait(2000);
        $this->assertPageContainsText($tipo);
        $this->validaDadoNoXPath($nome);
        $this->getSession()->wait(3000);
    }

    /**
     * @When clico no botao Adicionar Contato
     */
    public function clicoNoBotaoAdicionarContato()
    {
        $this->getSession()->wait(2000);
        $this->clickLink("Adicionar Contato");
    }

    /**
     * @When clico no botão Excluir Contato para remover o contato tres
     */
    public function clicoNoBotaoExcluirContatoParaRemoverOContatoTres()
    {
        $this->xpathClick('//*[@id="partner-contacts"]/div/div/div[3]/div[2]/div[3]/span');
    }

    /**
     * @Given clico no campo para informar o parceiro
     */
    public function clicoNoCampoParaInformarOParceiro()
    {
        $this->xpathClick('//*[@id="campaign-fields"]/div/div[1]/div[2]/div[1]/span/span[1]/span');
    }

    /**
     * @Given clico no campo para informar o parceiro da campanha
     */
    public function clicoNoCampoParaInformarOParceiroDaCampanha()
    {
        $this->xpathClick('//*[@id="search-campaign"]/form/div[1]/span/span[1]/span/span[1]/span');
    }

    /**
     * @Given informo o nome :arg1 para parceiro
     */
    public function informoONomeParaParceiro($parceiro)
    {
        $this->selectOption("status", $parceiro);
    }

    /**
     * @When informo o nome :arg1 para o parceiro
     */
    public function informoONomeParaOParceiro($parceiro)
    {
        $this->getSession()->wait(2000);
        $js = "$('.select2-search__field').val('".$parceiro."')";
        $js .= ".trigger('keyup',{keyCode:84})";
        $js .= ".trigger('keyup',{keyCode:73})";
        $js .= ".trigger('keyup',{keyCode:77})";
        $js .= ".trigger('keyup',{keyCode:69})";
        $js .= ".trigger('keyup',{keyCode:32})";
        $js .= ".trigger('keyup',{keyCode:83})";
        $js .= ".trigger('keyup',{keyCode:80})";
        $js .= ".trigger('keyup',{keyCode:65})";
        $js .= ".trigger('keyup',{keyCode:82})";
        $js .= ".trigger('keyup',{keyCode:84})";
        $js .= ".trigger('keyup',{keyCode:65})";
        $js .= ".trigger('keyup',{keyCode:67})";
        $js .= ".trigger('keyup',{keyCode:85})";
        $js .= ".trigger('keyup',{keyCode:83})";
        $js .= ".trigger('keyup',{keyCode:70})";
        $js .= ".trigger('keyup',{keyCode:73})";
        $js .= ".trigger('keyup',{keyCode:76})";
        $js .= ".trigger('keyup',{keyCode:73})";
        $js .= ".trigger('keyup',{keyCode:65})";
        $js .= ".trigger('keyup',{keyCode:73})";
        $js .= ".trigger('keyup',{keyCode:85})";
        $js .= ".trigger('keyup',{keyCode:83})";
        $js .= ".val('".$parceiro."')";
        $this->getSession()->executeScript($js);
        $this->getSession()->wait(2000);

        $js = "$('.js-search-partner').select2('close');";
        $this->getSession()->executeScript($js);
    }

    /**
     * @When informo o nome :arg1 da campanha
     */
    public function informoONomeDaCampanha($campanha)
    {
        $this->getSession()->wait(2000);
        $js = "$('.select2-search__field').val('".$campanha."')";
        $js .= ".trigger('keyup',{keyCode:84})";
        $js .= ".trigger('keyup',{keyCode:73})";
        $js .= ".trigger('keyup',{keyCode:77})";
        $js .= ".trigger('keyup',{keyCode:69})";
        $js .= ".trigger('keyup',{keyCode:32})";
        $js .= ".trigger('keyup',{keyCode:83})";
        $js .= ".trigger('keyup',{keyCode:80})";
        $js .= ".trigger('keyup',{keyCode:65})";
        $js .= ".trigger('keyup',{keyCode:82})";
        $js .= ".trigger('keyup',{keyCode:84})";
        $js .= ".trigger('keyup',{keyCode:65})";
        $js .= ".trigger('keyup',{keyCode:67})";
        $js .= ".trigger('keyup',{keyCode:85})";
        $js .= ".trigger('keyup',{keyCode:83})";
        $js .= ".trigger('keyup',{keyCode:70})";
        $js .= ".trigger('keyup',{keyCode:73})";
        $js .= ".trigger('keyup',{keyCode:76})";
        $js .= ".trigger('keyup',{keyCode:73})";
        $js .= ".trigger('keyup',{keyCode:65})";
        $js .= ".trigger('keyup',{keyCode:73})";
        $js .= ".trigger('keyup',{keyCode:85})";
        $js .= ".trigger('keyup',{keyCode:83})";
        $js .= ".val('".$campanha."')";
        $this->getSession()->executeScript($js);
        $this->getSession()->wait(2000);

        $js = "$('.js-search-campaign').select2('close');";
        $this->getSession()->executeScript($js);
    }

    /**
     * @Given informo o nome :arg1 para campanha
     */
    public function informoONomeParaCampanha($campanha)
    {
        $this->fillField("descricao", $campanha);
    }

    /**
     * @Given informo a ação :arg1
     */
    public function informoAAcao($acao)
    {
        $this->fillField("acao", $acao);
    }

    /**
     * @When informo uma data atual para inicio da campanha
     */
    public function informoUmaDataAtualParaInicioDaCampanha()
    {
        $data = date('d/m/Y');
        $js = "$('input[id=dataInicio]').val('". $data ."');";
        $this->getSession()->executeScript($js);
    }

    /**
     * @When informo uma data atual para validade da campanha
     */
    public function informoUmaDataAtualParaValidadeDaCampanha()
    {
        $data = date('d/m/Y');
        $js = "$('input[id=dataFim]').val('". $data ."');";
        $this->getSession()->executeScript($js);
    }

    /**
     * @When informo a data :arg1 para inicio da campanha
     */
    public function informoaDataParaInicioDaCampanha($data)
    {
        $js = "$('input[id=dataInicio]').val('". $data ."')";
        $this->getSession()->executeScript($js);
    }

    /**
    * @Given  informo a data :arg1 para validade da campanha
    */
    public function informoaDataParaValidadeDaCampanha($data)
    {
        $js = "$('input[id=dataFim]').val('". $data ."')";
        $this->getSession()->executeScript($js);
    }

    /**
     * @Given seleciono o Tipo da Campanha :arg1
     */
    public function selecionoOTipoDaCampanha($campanha)
    {
        $this->selectOption("tipo", $campanha);

        $url = $this->getSession()->getCurrentUrl();
        $url = str_replace('#','',$url);
        $this->getSession()->visit($url."#comercial-model");
    }

    /**
     * @When seleciono o Grupo :arg1 de plano para Campanha
     */
    public function selecionoOGrupoDePlanoParaCampanha2($plano)
    {
        $this->getSession()->wait(1000);
        $this->selectOption("urlHash", $plano);
    }

    /**
     * @When informo que a campanha :arg1 terá repasse
     */
    public function informoQueACampanhaTeraRepasse($repasse)
    {
        $this->selectOption("repasse", $repasse);
    }

    /**
     * @When clico em Criar Campanha
     */
    public function ClicoEmCriarCampanha()
    {
        $this->xpathClick('//*[@id="saveCampanha"]/div[4]/div/div/div/button');
        $this->getSession()->wait(3500);
    }

    /**
     * @When clico em Criar Parceiro
     */
    public function ClicoEmCriarParceiro()
    {
        $url = $this->getSession()->getCurrentUrl();
        $this->getSession()->visit($url."#partner-contacts");
        $this->xpathClick('//*[@id="saveParceiro"]/div[3]/div/div/button');
        $this->getSession()->wait(2000);
    }

    /**
     * @When clico no OK para fechar a Mensagem
     */
    public function ClicoNoOkParaFecharAMensagem()
    {
        $this->xpathClick('//*[@id="alert"]/a');
    }

    /**
     * @When altero o status da Campanha para :arg1
     */
    public function alteroOStatusDaCampanhaPara($status)
    {
        $this->selectOption("statusCampanhaId", $status);
    }

    /**
     * @Given informo a campanha :arg1
     */
    public function informoACampanha($nomeCampanha)
    {
        $this->getSession()->wait(2000);
        $this->fillField('pesquisa', $nomeCampanha);
        $this->getSession()->wait(2000);
    }

    /**
     * @When clico no parceiro :arg1
     */
    public function clicoNoParceiro($parceiro)
    {
        $this->getSession()->wait(2000);
        $this->clickLink($parceiro);
    }

    /**
     * @When clico na campanha :arg1
     */
    public function clicoNaCampanha($campanha)
    {
        $this->getSession()->wait(2000);
        $this->clickLink($campanha);
    }

    /**
     * @When visualizo o cadastro da Campanha :arg1
     */
    public function visualizoOCadastroDaCampanha($campanha)
    {
        $this->validaDadoNoXPath($campanha);
    }

    /**
     * @When visualizo a campanha cadastrada com status :arg1
     */
    public function visualizoACampanhaCadastradaComStatus($statusCampanha)
    {
        $this->assertPageContainsText($statusCampanha);
    }

    /**
     * @Then valido o campo :arg1 esta bloqueado para alteração
     */
    public function validoOCampoEstaBloqueadaParaAlteracao($campos)
    {
        $xPath = $this->xPathCamposCampanha[$campos];
        $this->validaCampoSomenteLeitura('readonly',$xPath);
    }

    /**
     * @Then valido o campo :arg1 esta desbloqueada para alteração
     */
    public function validoOCampoEstaDesbloqueadaParaAlteracao($campos)
    {
        $xPath = $this->xPathCamposCampanha[$campos];
        $this->validaCampoDesbloqueado('readonly',$xPath);
    }

    /**
     * @Then clico em Cancelar a Campanhas
     */
    public function clicoEmCancelarACampanhas()
    {
        $url = $this->getSession()->getCurrentUrl();
        $this->getSession()->visit($url."#comercial-model");
        $this->xpathClick('//*[@id="saveCampanha"]/div[5]/div/div/a');

        $this->getSession()->wait(2000);
    }

    /**
     * @Then clico em Continuar o Cancelamento das alterações
     */
    public function clicoEmContinuarOCancelamentoDasAlteracoes()
    {
        $this->xpathClick('//*[@id="acao-cancelar"]/a[2]');
    }

    /**
     * @When seleciono o plano :arg1 que será exibido na tela do seguro
     */
    public function selecionoOPlanoQueSeraExibidoNaTelaDoSeguro($planos)
    {
        $xPath = $this->xPathCamposCampanha[$planos];
        $this->xpathClick($xPath);
    }

    /**
     * @Given clico em Editar Layout
     */
    public function clicoEmEditarLayout()
    {
        $this->clickLink('editLayout');
        $this->getSession()->wait(2000);
    }

    /**
     * @When Vejo a tela para editar Layout da Campanha
     */
    public function vejoATelaParaEditarLayoutDaCampanha()
    {
        $this->assertPageContainsText('Cor Principal');
        $this->assertPageContainsText('Título');
        $this->assertPageContainsText('Subtítulo');
    }

    /**
     * @When seleciono o logo do parceiro
     */
    public function selecionoOLogoDoParceiro()
    {
        $this->attachFileToField('logoUpload', '/home/joseanastacio/Imagens/spartacus.jpg');
        $this->getSession()->wait(2000);
    }

    /**
     * @When informo o titulo :arg1 para a campanha
     */
    public function informoOTituloParaACampanha($titulo)
    {
        $this->fillField('titulo',$titulo);
    }

    /**
     * @When informo a frase de Icentivo :arg1 para a campanha
     */
    public function infotmoAFraseDeIcentivoParaACampanha($frase)
    {
        $this->fillField('fraseIncentivo',$frase);
    }

    /**
     * @When informo o codigo hehadecial :arg1 para a cor Predominante
     */
    public function informoOCodigoHehadecialParaACorPredominante($cor)
    {
        $element = $this->getSession()->getPage()->find('css', '.sp-input');
        $element->setValue($cor);
    }

    /**
     * @When clico na pŕe visualização do Seguro
     */
    public function clicoNaPreVisualizacaoDoSeguro()
    {
        $this->xpathClick('//*[@id="example-tabs"]/li[2]/a');
    }

    /**
     * @When Visualizo o Seguro
     */
    public function visualizoOSeguro()
    {
        $this->getSession()->switchToIFrame('seguro');
        $this->assertPageContainsText('Plano e forma de pagamento');
    }

    /**
     * @When clico em OK
     */
    public function clicoEmOk()
    {
        $this->getSession()->wait(1000);
        $this->getSession()->switchToIFrame();
        $this->xpathClick('//*[@id="edit-layout"]/div/div[2]/a');
        $this->getSession()->wait(1000);
    }

    /**
     * @When infomor o Layout da Campanha
     */
    public function infomorOLayoutDaCampanha()
    {
        $this->clicoEmEditarLayout();
        $this->vejoATelaParaEditarLayoutDaCampanha();
        $this->selecionoOLogoDoParceiro();
        $this->informoOTituloParaACampanha('Template Padrão');
        $this->infotmoAFraseDeIcentivoParaACampanha('Frase Padrão');
        $this->informoOCodigoHehadecialParaACorPredominante('#37bb64');
        $this->clicoNaPreVisualizacaoDoSeguro();
        $this->visualizoOSeguro();
        $this->clicoEmOk();
    }

    /**
     * @Then visualizo a opção de Gerar Lotes
     */
    public function visualizoAOpcaoDeGerarLotes()
    {
        $js = "$('html, body').animate({scrollTop: $('[type=submit]').offset().top}, 500)";
        $this->getSession()->executeScript($js);
        $this->assertPageContainsText('Gerar Lote');
    }

    /**
     * @Then clico no botao Gerar Lote
     */
    public function clicoNoBotaoGerarLote()
    {
        $this->getSession()->wait(1000);
        $this->xpathClick('//*[@id="voucher-type"]/div/div/div[3]/div/a');
    }

    /**
     * @Then informo a quantidade de Vouchers
     */
    public function informoAQuantidadeDeVouchers()
    {
        $this->getSession()->wait(3000);
        $this->fillField('quantidade','5');
    }

    /**
     * @Then seleciono a :arg1
     */
    public function selecionoA($filial)
    {
        $this->selectOption('filiais[]', $filial);
    }

    /**
     * @Then seleciono a opção Gerar para todas as filiais
     */
    public function selecionoAOpcaoGerarParaTodasAsFiliais2()
    {
        $this->checkOption('todos');
    }

    /**
     * @Then clico em gerar
     */
    public function clicoEmGerar()
    {
        $this->getSession()->wait(1000);
        $this->xpathClick('//*[@id="gera-lote"]/div[2]/div/a[2]');
        $this->getSession()->wait(2000);
    }

    /**
     * @Then Visualizo o lote :arg1 Gerado para a :arg2
     */
    public function visualizoOLoteGeradoParaA($lote, $filial)
    {
        $js = "$('html, body').animate({scrollTop: $('[type=submit]').offset().top}, 500)";
        $this->getSession()->executeScript($js);
        $this->getSession()->wait(1000);
        $data = date('Y-m-d');
        $this->assertPageContainsText($lote."_".$filial."_".$data);
        $this->assertPageContainsText($lote."_".$filial."_".$data);
    }

    /**
     * @Then clico em Downlod para baixar o lote
     */
    public function clicoEmDownlodParaBaixarOLote()
    {
        $this->xpathClick('//*[@id="generatedVouchers"]/div/div/ul/li[2]/a/strong');
    }

    /**
     * @Then clico em Downlod para baixar o lote da filial1
     */
    public function clicoEmDownlodParaBaixarOLoteDaFilial1()
    {
        $this->xpathClick('//*[@id="generatedVouchers"]/div/div/ul/li/a/strong');
    }

    /**
     * @Then clico em Cancelar a geração do Voucher
     */
    public function clicoEmCancelarAGeracaoDoVoucher()
    {
        $this->getSession()->wait(2000);
        $this->xpathClick('//*[@id="gera-lote"]/div[2]/div/a[1]');
        $this->getSession()->wait(1000);
    }

    /**
     * @Given clico no menu em Relatorios :arg1
     */
    public function clicoNoMenuEmRelatorios($itemMenu)
    {
        $this->clickLink($itemMenu);
    }

    /**
     * @Then visualizo os dados do :arg1 gerados
     */
    public function visualizoOsDadosDoParceiroGerados($parceiro)
    {
        $this->getSession()->wait(3000);
        $this->assertPageContainsText($parceiro);
    }

    /**
     * @Then visualizo os dados de :arg1 :arg2 gerados
     */
    public function visualizoOsDadosDeGerados($dado1, $dado2)
    {
        $this->assertPageContainsText($dado1, $dado2);
    }

    /**
     * @Then visualizo os dados de :arg1 :arg2 :arg3 gerados
     */
    public function visualizoOsDadosDeGerados2($dado1, $dado2, $dado3)
    {
        $this->assertPageContainsText($dado1, $dado2, $dado3);
    }

    /**
     * @Then visualizo as campanhas :arg1 geradas para o parceiro
     */
    public function visualizoAsCampanhasGeradasParaOParceiro($campanha)
    {
        $this->getSession()->wait(3000);
        $this->assertPageContainsText($campanha);
    }

    /**
     * @When processo os dados
     */
    public function processoOsDados()
    {
        $js = "$('.js-datepicker').eq(1).trigger('changeDate')";
        $this->getSession()->executeScript($js);

        $this->getSession()->wait(3000);
    }

    /**
     * @When clico no campo para informar a campanha
     */
    public function clicoNoCampoParaInformarACampanha()
    {
        $this->xpathClick('//*[@id="search-campaign"]/form/div[1]/span');
    }

    /**
     * @Then clico para vizualizar mais planos
     */
    public function clicoParaVizualizarMaisPlanos()
    {
        $js = "$('html, body').animate({scrollTop: $('.plan h5').eq(0).offset().top}, 500)";
        $this->getSession()->executeScript($js);
    }

    /**
     * @Then clico para vizualizar o planos
     */
    public function clicoParaVizualizarOPlanos()
    {
        $js = "$('html, body').animate({scrollTop: $('.plan h4').last().top}, 500)";
        $this->getSession()->executeScript($js);
    }

    /**
     * @Then clico em Exportação Dados
     */
    public function clicoEmExportacaoDados()
    {
        $this->xpathClick('//*[@id="search-campaign"]/form/div[3]/a/span');
    }

}