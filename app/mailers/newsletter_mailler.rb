class NewsletterMailer < ActionMailer::Base

  def send_newsletter(newsletter, to)
    @url  = "http://example.com/login"
    mail(:to => to, :subject => "Welcome to My Awesome Site")
  end
end
