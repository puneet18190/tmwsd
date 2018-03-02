# -*- encoding : utf-8 -*-
class MessagesController < ApplicationController

  before_filter :get_message, :only => [:update, :show]
  before_filter :login_required, :only => [:show, :update]

  def index
    if user_signed_in?
      @messages = current_user.messages.order("id desc").paginate(:page => params[:page],
                                                                  :per_page => params[:per_page] || 5)
    else
      redirect_to root_path
    end
  end

  def new
    @message = Message.new(:terms_of_service => true)
  end

  def create
    if user_signed_in?
      @message = current_user.messages.new(params[:message])
    else
      @message = Message.new(params[:message])
    end
    @message.sender_ip_address = request.remote_ip
    if @message.save
      redirect_to @message
    else
      render "new"
    end
  end

  def update
    if @message.update_attributes(params[:message])
      redirect_to @message, :notice => "Message updated."
    else
      flash.now[:error] = "You must enter both name and a valid email address."
      render "show"
    end
  end


protected

  def get_message
    @message = Message.find_by_url(params[:id])
    redirect_to missing_path if !@message
  end

  def login_required
    authenticate_user! if @message.user && !user_signed_in?
  end

end
