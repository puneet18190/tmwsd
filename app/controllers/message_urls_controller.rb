# -*- encoding : utf-8 -*-
class MessageUrlsController < ApplicationController

  def create
    @message = Message.find_by_url(params[:message_id])
    if @message && !@message.deleted?
      @message_url = @message.message_urls.create
      render :json => @message_url.to_json(:only => [:id, :url])
    else
      head :not_found
    end
  end

end
