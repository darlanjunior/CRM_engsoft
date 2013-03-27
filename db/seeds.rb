
# Criando banner
Banner.create(:width => 728, :height => 90, :name => 'New Relic', :image => open('http://s0.2mdn.net/viewad/3742665/1-728x90_All.jpg'))

# Criando contatos
Contact.create(:name => 'Alan Dabien Barroso', :email => 'alandbarroso@gmail.com', :phone => '(17) 8191-5295', :address => 'Av. Nossa Senhora')
Contact.create(:name => 'Victor Lassance Oliveira e Silva', :email => 'vlassance@gmail.com', :phone => '(17) 8191-5295', :address => 'Av. Nossa Senhora')
Contact.create(:name => 'Felipe Santana', :email => 'felipe.castrosantana@gmail.com', :phone => '(17) 8191-5295', :address => 'Av. Nossa Senhora')

#Criando ligações
c = Call.new(:reason => 'Ausente do sistema por muito tempo', :comments => 'Cliente antigo', :status => 'Pendente', :call_date => DateTime.now)
c.contact = Contact.first
c.save

#Criando grupo de contatos
g = ContactGroup.new(:name => 'Grupo labsoft')
g.contacts = Contact.all
g.save

#Criando empregado
Employee.create(:name => 'Jorge Risco', :dateOfBirth => DateTime.now)

#Criando FAQ
s = Subject.create(:subject => 'Usabilidade', :description => 'Problemas relacionados com a usabilidade do sistema')
f = Faq.new(question: 'Como posso cadastrar uma duvida no sistema?', answer: 'Basta clicar em cadastrar duvida.')
f.subject = s
f.save

#Criando newsletter
Newsletter.create(title: 'Nova vaga de estagio', message_body: 'Vaga de TI disponivel no Estagio facil, venha conferir! Bjs Marloca')

#Criando chamado
s = SupportCase.new(description: 'Bug ao se cadastrar numa nova vaga', status: 'Em andamento')
s.contact = Contact.last
s.save
