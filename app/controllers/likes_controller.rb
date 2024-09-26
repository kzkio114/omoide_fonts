class LikesController < ApplicationController
  before_action :set_font

  def toggle_like
    # IPアドレスとセッションIDで「いいね」を判別
    ip_address = request.remote_ip
    session_id = session[:session_id]
    
    # 既存の「いいね」を探す
    existing_like = Like.find_by(font: @font, ip_address: ip_address, session_id: session_id)

    respond_to do |format|
      if existing_like
        # すでに「いいね」がある場合は削除
        existing_like.destroy
        format.turbo_stream { render turbo_stream: turbo_stream.replace("likes_count_#{@font.id}", partial: "likes/likes_count", locals: { font: @font }) }
      else
        # 「いいね」がない場合は新規作成
        @like = @font.likes.create(ip_address: ip_address, session_id: session_id)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("likes_count_#{@font.id}", partial: "likes/likes_count", locals: { font: @font }) }
      end
    end
  end


  private

  def set_font
    @font = Font.find(params[:font_id])
  end
end
