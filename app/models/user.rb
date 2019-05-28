class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  # include Mongoid::MultiParameterAttributes
  field :first_name, type: String
  field :last_name, type: String
  field :birthday, type: Date
  field :address, type: String
end
