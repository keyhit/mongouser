class UserDatatable
  def self.data(params)
    number_page = (params[:start].to_i / 10) + 1
    records_per_page = 10
    search_value = params["search"]["value"]
    sort_value = params['order']['0']['dir']
    
    #(067-209-09-53)
    
    column_key = params['order']['0']['column'].to_i

    if column_key
      column_value_by_key = User.fields.keys[column_key]
    else
      column_value_by_key = 1
    end

    #binding.pry
    if  search_value.present?
      print "search Value #{ search_value}".red
      users = User.search(search_value).order_by( column_value_by_key => "#{sort_value}")
      # binding.pry
    else 
      users = User.all.order_by( column_value_by_key => "#{sort_value}")

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
