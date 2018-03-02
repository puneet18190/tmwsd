# -*- encoding : utf-8 -*-

module MessagesHelper

  def short_message_url(message)
    short_url(message, :host => Tmwsd::Config[:domain] || "⌫.ws", :protocol => Tmwsd::Config[:protocol] || "https")
  end

end
