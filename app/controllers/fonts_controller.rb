class FontsController < ApplicationController
  before_action :set_font, only: [:toggle_like]

  def toggle_like
    ip_address = request.remote_ip
    session_id = session[:session_id]
  
    existing_like = Like.find_by(font: @font, ip_address: ip_address, session_id: session_id)
  
    respond_to do |format|
      if existing_like
        # すでに「いいね」がある場合は削除
        if existing_like.destroy
          format.turbo_stream { render turbo_stream: turbo_stream.replace("likes_count_#{@font.id}", partial: "likes/likes_count", locals: { font: @font }) }
        else
          # 削除に失敗した場合
          Rails.logger.error "Error: Like could not be destroyed"
          format.turbo_stream { render turbo_stream: turbo_stream.replace("flash", partial: "shared/flash", locals: { message: "いいねの削除に失敗しました。" }) }
        end
      else
        # 「いいね」がない場合は新規作成
        @like = @font.likes.build(ip_address: ip_address, session_id: session_id)
        if @like.save
          format.turbo_stream { render turbo_stream: turbo_stream.replace("likes_count_#{@font.id}", partial: "likes/likes_count", locals: { font: @font }) }
        else
          # 作成に失敗した場合
          Rails.logger.error "Error: Like could not be created"
          format.turbo_stream { render turbo_stream: turbo_stream.replace("flash", partial: "shared/flash", locals: { message: "いいねの作成に失敗しました。" }) }
        end
      end
    end
  end
  

  private

  def set_font
    @font = Font.find(params[:id])
  end
end
