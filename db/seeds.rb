
# Criando banner
Banner.delete_all
Banner.create(:width => 728, :height => 90, :name => 'New Relic', :image => open('http://s0.2mdn.net/viewad/3742665/1-728x90_All.jpg'))

# Criando contatos
Contact.delete_all
alan = Contact.create!(:name => 'Alan Dabien Barroso', :email => 'alandbarroso@gmail.com', :phone => '1781915295', :address => 'Av. Nossa Senhora', :clientType => 'resp_instituicao')
victor = Contact.create!(:name => 'Victor Lassance Oliveira e Silva', :email => 'vlassance@gmail.com', :phone => '1781915295', :address => 'Av. Nossa Senhora', :clientType => 'resp_instituicao')
felipe = Contact.create!(:name => 'Felipe Santana', :email => 'felipe.castrosantana@gmail.com', :phone => '1781915295', :address => 'Av. Nossa Senhora', :clientType => 'resp_empresa')
darlan = Contact.create!(:name => 'Darlan Junior', :email => 'darlan.sbjr@gmail.com', :phone => '1781915295', :address => 'Av. Nossa Senhora', :clientType => 'resp_empresa')

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

#Criando empregado
Employee.delete_all
Employee.create!(:name => 'Jorge Risco', :dateOfBirth => DateTime.now)

#Criando FAQ
Subject.delete_all
Faq.delete_all
s = Subject.create!(:subject => 'Usabilidade', :description => 'Problemas relacionados com a usabilidade do sistema')
f = Faq.new(question: 'Como posso cadastrar uma duvida no sistema?', answer: 'Basta clicar em cadastrar duvida.')
f.subject = s
f.save

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
