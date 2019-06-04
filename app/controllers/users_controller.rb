class UsersController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json:
        @table = UserDatatable.new(params)
        # @table.filtered_data
        # @table.paginated_data
        @table.array_builder
        # @table.hash_buider
   

      end
    end
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :address)
  end
end
