class UserDatatable
  def initialize(params)
    @params = params
  end

  def filtered_data
    puts "#{}".red
    puts "@params#{@params}\n".red

    @search_value = @params['search']['value']
    puts "@search_value-#{@search_value}-\n".red
    @sort_value = @params['order']['0']['dir']
    puts "@sort_value-#{@sort_value}-\n".red
    @column_key = @params['order']['0']['column'].to_i + 1
    puts "@params-#{@params}-\n".red
    @column_value_by_key = User.fields.keys[@column_key]
    puts "@column_value_by_key-#{@column_value_by_key}-\n".red
    
    
    
    if  @search_value
       User.search(@search_value).order_by(@column_value_by_key => @sort_value.to_s)
    else 
      User.all.order_by(@column_value_by_key => @sort_value.to_s)
    end
  end
  
  def paginated_data
    puts "filtered_data#{filtered_data}-\n".green
    @records_per_page = 10
    @number_page = (@params[:start].to_i / 10) + 1
    @paginated_data = filtered_data.page(@number_page).per(@records_per_page)
    puts "filtered_data.page(@number_page).per(@records_per_page)#{filtered_data.page(@number_page).per(@records_per_page)}-\n".green
  end
  
  def array_builder
    puts "paginated_data#{paginated_data}-\n".blue
    @multi_level_array = []
    @paginated_data.each do |user|
      @multi_level_array << [
        user.first_name,
        user.last_name,
        user.birthday,
        user.address
      ]
    end
    puts "@multi_level_array#{@multi_level_array}-\n".blue
  end
  
  def hash_buider
    # binding.pry
     {
      recordsTotal: filtered_data.to_a.size,
      recordsFiltered: filtered_data.to_a.size,
      data: @multi_level_array
    }
  end
end
