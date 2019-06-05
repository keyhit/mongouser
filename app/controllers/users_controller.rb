class UsersController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        table = UserDatatable.new
        table.params = params
        table.debug
        puts "table.data - #{table.data}".blue
        render json: table.data
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :address)
  end
end
