class TopsController < ApplicationController
  def index
    @fonts = Font.all # フォントの一覧を取得
  end
  def show
  end
end
