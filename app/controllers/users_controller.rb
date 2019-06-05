class UsersController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        table = UserDatatable.new
        table.params = params
        # table.debug
        # puts "table.ready_hash - #{table.ready_hash}".blue
        render json: table.ready_hash
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :address)
  end
end
