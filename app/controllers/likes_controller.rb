class LikesController < ApplicationController
  before_action :set_font

  def create
    ip_address = request.remote_ip
    session_id = session[:session_id]

    if Like.exists?(font: @font, ip_address: ip_address) || Like.exists?(font: @font, session_id: session_id)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("flash", partial: "shared/flash", locals: { message: "すでにいいねしています。" }) }
      end
    else
      @like = @font.likes.create(ip_address: ip_address, session_id: session_id)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("likes_count_#{@font.id}", partial: "likes/likes_count", locals: { font: @font }) }
      end
    end
  end

  private

  def set_font
    @font = Font.find(params[:font_id])
  end
end
