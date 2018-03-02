# -*- encoding : utf-8 -*-
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value =~ /ccontrol\.com\.mx/i
      record.errors[attribute] = (options[:message] || "this address is forbidden")
    end
    email_name_regex  = '[A-Z0-9_\.%\+\-\']+'
    domain_head_regex = '(?:[A-Z0-9\-]+\.)+'
    domain_tld_regex  = '(?:[A-Z]{2,4}|museum|travel)'
    record.errors[attribute] << (options[:message] || "is not an email") unless
      value =~ /^#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}$/i
  end
end
