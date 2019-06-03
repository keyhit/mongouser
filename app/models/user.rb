class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  # include Mongoid::MultiParameterAttributes
  field :first_name, type: String
  field :last_name, type: String
  field :birthday, type: Date
  field :address, type: String

  validates :first_name, presence: true,
                        length: {minimum:1, maximum:20}
  
  validates :last_name, presence: true,
                        length: {minimum:1, maximum:20}

  validates :address, presence: true,
                        length: {minimum:1, maximum:60}

  def self.search(search_value)
    if search_value
      any_of( { first_name: /#{search_value.downcase}/i}, { last_name: /#{search_value.downcase}/i}, { address: /#{search_value.downcase}/i})
    end
  end
end
#{ birthday: /#{search_value.downcase}/i}