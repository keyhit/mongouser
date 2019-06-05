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

  def columns_builder
    @multi_level_array = []
    paginated_users.each do |user|
      @multi_level_array << [
        user.first_name,
        user.last_name,
        user.birthday,
        user.address]
    end
  end

  def data
    {
      recordsTotal: users.to_a.size,
      recordsFiltered: users.to_a.size,
      data: @multi_level_array
    }
  end

  def debug
  puts "number_page - #{number_page}".green
  puts "search_value - #{search_value}".green
  puts "sort_value - #{sort_value}".green
  puts "column_key - #{column_key}".green
  puts "column_value_by_key - #{column_value_by_key}".green
  puts "users - #{users.to_a}".green
  puts "paginated_users - #{paginated_users.to_a}".green
  puts "columns_builder - #{columns_builder.to_a}".green
  puts "data - #{data.to_h}".green
  puts "@multi_level_array - #{@multi_level_array}".yellow

end
end











# 2
# class UserDatatable
#   def data=(params)
#     number_page = (params[:start].to_i / 10) + 1
#     records_per_page = 10
#     search_value = params["search"]["value"]
#     sort_value = params['order']['0']['dir']
#     column_key = params['order']['0']['column'].to_i
#     column_value_by_key = User.fields.keys[column_key]

#     if  search_value.present?
#       users = User.search(search_value).order_by(column_value_by_key => sort_value)
#     else 
#       users = User.all.order_by(column_value_by_key => sort_value)
#     end

#     paginated_users = users.page(number_page).per(records_per_page)

#     multi_level_array = []
#     paginated_users.each do |user|
#       multi_level_array << [
#         user.first_name,
#         user.last_name,
#         user.birthday,
#         user.address]
#     end

#     {
#       recordsTotal: users.to_a.size,
#       recordsFiltered: users.to_a.size,
#       data:  multi_level_array
#     }
#   end
# end




# 1
# class UserDatatable
#   def self.data(params)
#     number_page = (params[:start].to_i / 10) + 1
#     records_per_page = 10
#     search_value = params["search"]["value"]
#     sort_value = params['order']['0']['dir']
#     column_key = params['order']['0']['column'].to_i
#     column_value_by_key = User.fields.keys[column_key]

#     if  search_value.present?
#       users = User.search(search_value).order_by(column_value_by_key => sort_value)
#     else 
#       users = User.all.order_by(column_value_by_key => sort_value)
#     end

#     paginated_users = users.page(number_page).per(records_per_page)

#     multi_level_array = []
#     paginated_users.each do |user|
#       multi_level_array << [
#         user.first_name,
#         user.last_name,
#         user.birthday,
#         user.address]
#     end

#     {
#       recordsTotal: users.to_a.size,
#       recordsFiltered: users.to_a.size,
#       data:  multi_level_array
#     }
#   end
# end