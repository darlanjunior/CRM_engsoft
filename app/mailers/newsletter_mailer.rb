class NewsletterMailer < ActionMailer::Base

  def send_newsletter(newsletter, contact)
  	@title = newsletter.title
    @message_body  = newsletter.message_body
    @username = contact.name
    mail(:from => "newsletter@estagiofacil.com" ,:to => contact.email, :subject => newsletter.title)
  end
end
