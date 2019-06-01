class UserDatatable
  def self.data(params)
    number_page = (params[:start].to_i / 10) + 1
    records_per_page = 10

    if  params["search"]["value"] != ""
      print "search Value #{ params['search']['value']}".red
      users = User.where(first_name: "/#{params['search']['value']}/")
    else 
      users = User.all
    end


    paginated_users = users.page(number_page).per(records_per_page)

    multi_level_array = []
    paginated_users.each do |user|
      multi_level_array << [
        user.id,
        user.first_name,
        user.last_name,
        user.birthday,
        user.address,
        '<b><a href="">Actions</a></b>'] # I will edited this last column later
    end

    result =
      {
        recordsTotal: users.to_a.size,
        recordsFiltered: users.to_a.size,
        data:  multi_level_array
      }

      # binding.pry
      
  end
end
