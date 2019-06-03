class UserDatatable
  def self.data(params)
    number_page = (params[:start].to_i / 10) + 1
    records_per_page = 10

    search_value = params["search"]["value"]
    if  search_value.present?
      print "search Value #{ search_value}".red
      users = User.search(search_value)

      # u_first_name = User.where( { first_name: /.*#{search_value}.*/ } )
      # u_last_name = User.where( { last_name: /.*#{search_value}.*/ } )
      # users = users_first_name + users_last_name
    
      
    else 
      users = User.all
    end
    
    
    paginated_users = users.page(number_page).per(records_per_page)
    
    #  binding.pry

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
  end
end
