# -*- encoding : utf-8 -*-
ActionMailer::Base.delivery_method     = Tmwsd::Config[:delivery_method] && Tmwsd::Config[:delivery_method].to_sym || :postmark
ActionMailer::Base.postmark_settings   = { :api_key => Tmwsd::Config[:postmark_api_key] }
ActionMailer::Base.default_url_options = { :host => Tmwsd::Config[:domain], :protocol => Tmwsd::Config[:protocol] || "https" }
