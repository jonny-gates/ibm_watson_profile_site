class PagesController < ApplicationController
  def home
    if params[:user_input]
      assistant = WatsonAssistant.new
      @message = assistant.send_message(params[:user_input])
    end
  end
end
