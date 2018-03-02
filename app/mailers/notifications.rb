# -*- encoding : utf-8 -*-

class Notifications < ActionMailer::Base

  def encrypted_message(message_url)
    @message_url = message_url
    @message     = message_url.message
    mail :from    => "TMWSD <message@tmwsd.ws>",
         :to      => "#{message_url.name} <#{message_url.email}>",
         :subject => "[⌫] You have been sent an encrypted message"
  end

  def signup_admin(user)
    @user = user
    mail :from    => "TMWSD <message@tmwsd.ws>",
         :to      => "Brandon Arbini <b@zencoder.com>",
         :subject => "[⌫] New signup from #{user.name} <#{user.email}>"
  end

end
