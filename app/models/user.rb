class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :first_name, type: String
  field :last_name, type: String
  field :birthday, type: String
  field :address, type: String

  validates :first_name, presence: true,
                         length: { minimum: 1, maximum: 20 }
  validates :last_name, presence: true,
                        length: { minimum: 1, maximum: 20 }
  validates :birthday, presence: true,
                       length: { is: 10 }
  validates :address, presence: true,
                      length: { minimum: 1, maximum: 60 }

  def self.search(search_value)
    if search_value
      any_of(
        { first_name: /#{search_value}/i },
        { last_name: /#{search_value}/i },
        { birthday:  /#{search_value}/i },
        { address: /#{search_value}/i }
       )
    end
  end
end
