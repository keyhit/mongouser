class UserDatatable
  RECORDS_PER_PAGE = 10
  attr_accessor :params

  def number_page
    @params[:start].to_i / 10
  end

  def search_value
    @params['search']['value']
  end

  def sort_value
    @params['order']['0']['dir']
  end

  def column_key
    @params['order']['0']['column'].to_i+1
  end

  def column_value_by_key
    User.fields.keys[column_key]
  end

  def users
    if  search_value
      User.search(search_value).order_by(column_value_by_key => sort_value)
    else
      User.all.order_by(column_value_by_key => sort_value)
    end
  end

  def paginated_users
    users.page(number_page).per(RECORDS_PER_PAGE)
  end

  def ready_hash
    @multi_level_array = []
    paginated_users.each do |user|
      @multi_level_array << [
        user.first_name,
        user.last_name,
        user.birthday,
        user.address]
    end
    {
      recordsTotal: users.to_a.size,
      recordsFiltered: users.to_a.size,
      data: @multi_level_array
    }
  end
end
