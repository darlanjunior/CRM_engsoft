class SupportMailer < ActionMailer::Base
  # To change this template use File | Settings | File Templates.
  def send_support_email(supportCase,content,contact)

    @supportCase =supportCase
    @clientName = contact.name
    @title = "Feedback referente ao chamado #{supportCase.description}"
    @content = content
    mail(:from => "suporte@estagiofacil.com" ,:to => contact.email, :subject => @title)

  end
end