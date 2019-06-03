class UserDatatable
  def self.data(params)
    number_page = (params[:start].to_i / 10) + 1
    records_per_page = 10
    search_value = params["search"]["value"]
    sort_value = params['order']['0']['dir']
    column_key = params['order']['0']['column'].to_i
    column_value_by_key = User.fields.keys[column_key]

    if  search_value.present?
      users = User.search(search_value).order_by(column_value_by_key => sort_value)
    else 
      users = User.all.order_by(column_value_by_key => sort_value)
    end

    paginated_users = users.page(number_page).per(records_per_page)

    multi_level_array = []
    paginated_users.each do |user|
    multi_level_array << [
      user.first_name,
      user.last_name,
      user.birthday,
      user.address,
      "<b><a href='users/#{user.id}'>Show</a> |
        <a href='users/#{user.id}/edit'>Edit</a> |
        <a href='users/#{user.id}'
        rel='nofollow'
        data-method='delete'
        data-confirm='Are you sure?'>Delete</a> </b>"]
    end

    {
      recordsTotal: users.to_a.size,
      recordsFiltered: users.to_a.size,
      data:  multi_level_array
    }
  end
end
