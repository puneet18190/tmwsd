# -*- encoding : utf-8 -*-
class AccessesController < ApplicationController

  before_filter :get_message, :only => [:authenticate, :show]
  before_filter :authenticate_message, :only => [:show]

  def show
    @body = @message.body
    @message_url.accessed!(:by => request.remote_ip)
    flash.now[:notice] = "This message has been deleted.<br>Once you leave this page it will no longer be accessible.".html_safe
  end


protected

  def get_message
    @message_url = MessageUrl.find_by_url(params[:id])
    if !@message_url || (@message_url && @message_url.deleted?)
      redirect_to missing_path
    else
      @message = @message_url.message
      if !@message || (@message && @message.deleted?)
        redirect_to missing_path
      end
    end
  end

  def authenticate_message
    if @message.requires_password? && params[:password].present?
      if !@message_url.authenticate(params[:password])
        if @message_url.deleted?
          redirect_to root_path,
                      :alert => "Too many failed attempts. The message has now been deleted."
        else
          redirect_to authenticate_path(@message_url),
                      :alert => "The password you entered is incorrect. Careful, you only have 3 tries."
        end
      else
        @message.authenticate(params[:password])
      end
    elsif @message.requires_password?
      redirect_to authenticate_path(@message_url)
    end
  end

end
