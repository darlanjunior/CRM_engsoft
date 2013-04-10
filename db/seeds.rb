# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Criando banner
Banner.delete_all
banner1 = Banner.create!(:width => 728, :height => 90, :name => 'New Relic', :image => open('http://s0.2mdn.net/viewad/3742665/1-728x90_All.jpg'))
banner2 = Banner.create!(:width => 728, :height => 90, :name => 'New Relic2', :image => open('http://s0.2mdn.net/viewad/3742665/1-728x90_All.jpg'))
banner3 = Banner.create!(:width => 728, :height => 90, :name => 'New Relic3', :image => open('http://s0.2mdn.net/viewad/3742665/1-728x90_All.jpg'))

# Criando contatos
Contact.delete_all
alan = Contact.create!(:name => 'Alan Dabien Barroso', :email => 'alandbarroso@gmail.com', :phone => '1781915295', :address => 'Av. Nossa Senhora de Assunção, 1100, Jaguaré, CEP 27200-002, São Paulo/SP', :client_type => 'aluno', :institution => 'POLI-USP')
victor = Contact.create!(:name => 'Victor Lassance', :email => 'vlassance@gmail.com', :phone => '1196012456', :address => 'Rua Válson Lopes, 70, Jaguaré, São Paulo', :client_type => 'aluno', :institution => 'POLI-USP')
felipe = Contact.create!(:name => 'Felipe Santana', :email => 'felipe.castrosantana@gmail.com', :phone => '1149640583', :address => 'Av. Bandeirantes, 3520, Zona Norte, São Paulo/SP', :client_type => 'aluno', :institution => 'POLI-USP')
darlan = Contact.create!(:name => 'Darlan Junior', :email => 'darlan.sbjr@gmail.com', :phone => '1188275489', :address => 'Av. Diógenes Lima Ribeiro, 2000, Pinheiros, São Paulo/SP', :client_type => 'aluno', :institution => 'POLI-USP')
risco = Contact.create!(:name => 'Jorce Risco Becerra', :email => 'jorge.becerra@poli.usp.br', :phone => '1130919091', :address => 'Av. Prof. Luciano Gualberto, travessa 3, 380, CEP 05508-010, São Paulo/SP', :client_type => 'admin_instituicao', :institution => 'POLI-USP')
michelet = Contact.create!(:name => 'Michelet', :email => 'michelet@usp.br', :phone => '1130919091', :address => 'Av. Prof. Luciano Gualberto, travessa 3, 380, CEP 05508-010, São Paulo/SP', :client_type => 'resp_instituicao', :institution => 'POLI-USP')
patricia = Contact.create!(:name => 'Patricia Sandes', :email => 'patricia.sandes@usp.br', :phone => '1130915262', :address => 'Av. Prof. Luciano Gualberto, travessa 3, 380, CEP 05508-010, São Paulo/SP', :client_type => 'resp_instituicao', :institution => 'POLI-USP')
solange = Contact.create!(:name => 'Solange Alves de Souza', :email => 'ssouza@usp.br', :phone => '1130915262', :address => 'Av. Prof. Luciano Gualberto, travessa 3, 380, CEP 05508-010, São Paulo/SP', :client_type => 'resp_instituicao', :institution => 'POLI-USP')
mark = Contact.create!(:name => 'Mark Zuckerberg', :email => 'mark.zuck@fb.com', :phone => '1132546780', :address => '1601 Willow Road, Menlo Park, California 94025, US', :client_type => 'admin_empresa', :institution => 'Facebook')
maxi = Contact.create!(:name => 'Maximilian Machedon', :email => 'maxi.machedon@fb.com', :phone => '1132546780', :address => '1601 Willow Road, Menlo Park, California 94025, US', :client_type => 'resp_empresa', :institution => 'Facebook')
daisy = Contact.create!(:name => 'Daisy Chu', :email => 'daisy.chu@bbm.com.br', :phone => '2125147448', :address => 'Praça Pio X, 98-A, Centro, CEP: 20091-040, Rio de Janeiro/RJ', :client_type => 'resp_empresa', :institution => 'BBM Investimentos')

#Criando ligações
Call.delete_all
c = Call.new(:reason => 'Ausente do sistema por muito tempo', :comments => 'Cliente antigo', :status => 'Pendente', :call_date => DateTime.now)
c.contact = Contact.first
c.save

#Criando grupo de contatos
ContactGroup.delete_all
labsoft = ContactGroup.new(:name => 'Grupo labsoft')
labsoft.contacts = Contact.all
labsoft.save

tcc_afv = ContactGroup.new(:name => 'TCC AFV')
tcc_afv.contacts = Array.new
tcc_afv.contacts << alan
tcc_afv.contacts << felipe
tcc_afv.contacts << victor
tcc_afv.save


#Criando Support Cases
caseStatusOnGoing = "Em andamento";
caseStatusClosed = "Fechado";
caseTypeProblem = "Problema";
caseTypeDoubt = "Duvida";

SupportCase.delete_all
SupportCase.create!(:contact => victor,:description => "Meu estagio nao aparece no portal", :status => caseStatusOnGoing, :caseType => caseTypeProblem)
SupportCase.create!(:contact => felipe,:description => "Como faco para colocar o meu curriculo no portal?", :status => caseStatusOnGoing, :caseType => caseTypeDoubt)
SupportCase.create!(:contact => alan,:description => "Meu estagio ja terminou, e continua registrado como atual", :status => caseStatusOnGoing, :caseType => caseTypeProblem)
SupportCase.create!(:contact => darlan,:description => "Como eu deleto o meu registro do portal?", :status => caseStatusOnGoing, :caseType => caseTypeDoubt)
SupportCase.create!(:contact => michelet,:description => "O portal esta travando quando faco o uploado do CV", :status => caseStatusOnGoing, :caseType => caseTypeProblem)
SupportCase.create!(:contact => patricia,:description => "O portal nao esta aceitando CV em .pdf", :status => caseStatusOnGoing, :caseType => caseTypeProblem)
SupportCase.create!(:contact => mark,:description => "Nao consigo alterar os meus dados no portal", :status => caseStatusOnGoing, :caseType => caseTypeProblem)
SupportCase.create!(:contact => felipe,:description => "Como posso parar de receber as newsletters?", :status => caseStatusOnGoing, :caseType => caseTypeDoubt)


#Criando empregado
Employee.delete_all
Employee.create!(:name => 'Jorge Risco', :dateOfBirth => 45.years.ago.localtime)
Employee.create!(:name => 'Patricia Sandes', :dateOfBirth => 35.years.ago.localtime)
Employee.create!(:name => 'Michelet', :dateOfBirth => 30.years.ago.localtime)
Employee.create!(:name => 'Solange Souza', :dateOfBirth => 43.years.ago.localtime)
Employee.create!(:name => 'Victor Lassance', :dateOfBirth => 23.years.ago.localtime)

#Criando FAQ
Subject.delete_all
Faq.delete_all
usabilidade = Subject.create!(:subject => 'Usabilidade', :description => 'Problemas relacionados com a usabilidade do sistema')
pesquisa_vagas = Subject.create!(:subject => 'Pesquisa de vagas', :description => 'Problemas relacionados com a pesquisa de vagas')
cadastro = Subject.create!(:subject => 'Meu cadastro', :description => 'Problemas relacionados com o cadastro e o acesso aos dados pessoais')
curriculo = Subject.create!(:subject => 'Meu currículo', :description => 'Problemas relacionados com o envio de currículos e a sua atualização')

tab = "&nbsp; &nbsp; "
f1 = Faq.create!(
  question: 'Como posso cadastrar uma duvida no sistema?',
  answer:
    """Basta clicar em cadastrar duvida.""",
  subject: usabilidade
)
f2 = Faq.create!(
  question: 'Como pesquisar uma vaga pelo seu código?',
  answer:
    """Todas as vagas divulgadas no portal possuem um código.
    Esse código pode ser encontrado na parte superior do anúncio ou no link da vaga (URL).\n
    Para pesquisar vagas pelo código, acesse o portal e siga os passos abaixo:
    #{tab}1) Na página de “Acesso de candidatos”, selecione a opção “Pesquisa de vagas” no menu superior da página do ambiente de candidatos;
    #{tab}2) Insira o código da vaga na barra de pesquisa e clique no botão “Pesquisar“.""",
  subject: pesquisa_vagas
)
f3 = Faq.create!(
  question: 'Como faço para pesquisar vagas?',
  answer:
    """Para pesquisar as vagas oferecidas pelas empresas que contratam é muito simples e prático!\n
    Acesse o portal e siga os passos a seguir:
    #{tab}1) Na página de “Acesso de candidatos”, selecione a opção ”Pesquisa de vagas”;
    #{tab}2) Na página de pesquisa, você pode pesquisar por palavras-chave e refinar os resultados por filtros.""",
  subject: pesquisa_vagas
)
f4 = Faq.create!(
  question: 'Quero cancelar/excluir meu currículo cadastrado, como faço?',
  answer:
    """É possível desativar o cadastro. 
    Porém, não é possível excluí-lo por completo, pois ele já foi compartilhado com algumas empresas.
    Seria como enviar um currículo impresso pelo correio e depois tentar recolhê-lo de volta, entende?\n
    Para desativar um cadastro, basta efetuar seu login no portal.
    Em sua área exclusiva de serviços, vá até a opção “Desativar o uso de nossos serviços”.""",
  subject: cadastro
)
f5 = Faq.create!(
  question: 'Esqueci minha identificação e/ou minha senha de acesso. O que fazer?',
  answer:
    """Acesse a área de candidatos e siga os passos abaixo:
    #{tab}1) Clique em “Login”, no topo da página;
    #{tab}2) Na tela de login, clique na opção “Se você esqueceu sua identificação, clique aqui” ou em “Se você esqueceu sua identificação/login, clique aqui“;
    #{tab}3) Na página seguinte informe o endereço de e-mail cadastrado no site e confirme. Você receberá automaticamente sua identificação e senha no endereço de e-mail cadastrado;
    #{tab}4) Ou, caso você tenha esquecido sua senha, será apresentado uma mensagem com o lembrete cadastrado por você e algumas outras dicas como as inicias de seu nome e seu provedor de email cadastrado.
    #{tab}5) Se ainda assim você não recordar sua senha, clique em: “mesmo com o lembrete acima, você não consegue lembrar de sua senha clique aqui” e ela será encaminhada automaticamente para e-mail que você cadastrou no site.""",
  subject: cadastro
)
f6 = Faq.create!(
  question: 'O meu endereço de e-mail mudou. Como alterá-lo?',
  answer:
    """Para alterar o seu endereço de e-mail, acesse a área de candidatos do portal e, se você já estiver logado no site, basta clicar em “Sua página de serviços” no menu superior da página do ambiente de candidatos.""",
  subject: cadastro
)
f7 = Faq.create!(
  question: 'Como cadastrar o meu currículo?',
  answer:
    """Para cadastrar seu currículo, acesse o portal e siga os passos abaixo:
    #{tab}1) Clique em “Acesso de candidatos”;
    #{tab}2) No menu superior da página do ambiente de candidatos, clique em “Cadastre seu currículo”;
    #{tab}3) Na página seguinte clique em “cadastre-o agora”;
    #{tab}4) Preencha os campos solicitados.""",
  subject: curriculo
)
f8 = Faq.create!(
  question: 'Quero enviar meu currículo em word, como faço?',
  answer:
    """Os processos seletivos são feitos pelo site, por isso para participar é necessário preencher o formulário de cadastro do seu currículo no portal.""",
  subject: curriculo
)
f9 = Faq.create!(
  question: 'Como faço para atualizar ou corrigir os dados meu currículo?',
  answer:
    """Para atualizar ou corrigir os seus dados, basta efetuar seu login no portal, acessar sua página exclusiva de serviços a candidatos, clicar em “Rever ou atualizar seu currículo” e, em seguida, clicar em “Atualizar o seu currículo”.""",
  subject: curriculo
)

#Criando newsletter
Newsletter.delete_all
news_marloca = Newsletter.new(:title => 'Nova vaga de estagio', :message_body => 'Vaga de TI disponivel no Estagio facil, venha conferir! Bjs Marloca')
news_marloca.contact_groups << labsoft
news_marloca.save

#Criando chamado
SupportCase.delete_all
s = SupportCase.new(description: 'Bug ao se cadastrar numa nova vaga', status: 'Em andamento')
s.contact = Contact.last
s.save

#Criando açao de marketing
MarketingAction.delete_all
action1 = MarketingAction.new(:name => 'Propaganda1', :description => 'Divulgacao da propaganda 1', :action_type => MarketingAction.marketing_types.first, :value => 666.66)
action1.banner = banner1
action1.save
action2 = MarketingAction.new(:name => 'Propaganda2', :description => 'Divulgacao da propaganda 2', :action_type => MarketingAction.marketing_types.first, :value => 666.66)
action2.banner = banner2
action2.save

#Criando campanha de marketing
MarketingCampaign.delete_all
MarketingCampaign.create!(:begin_date => "20/01/2012", :description => "Teste de descricao de campanha de marketing", :end_date => "22/01/2012", :estimated_begin_date => "19/01/2012", :estimated_end_date => "21/01/2012", :estimated_revenue => 100.23, :name => "Super Campanha de Marketing", :status => 1, :revenue => 98.05, :financial_feedback => "Campanha aprovada com sucesso")
