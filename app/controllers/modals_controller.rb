# app/controllers/modals_controller.rb
class ModalsController < ApplicationController
  def show
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append("modal-placeholder", partial: "shared/modal")
      end
    end
  end

  def destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove("modal")
      end
    end
  end
end
