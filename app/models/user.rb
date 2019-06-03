class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :first_name, type: String
  field :last_name, type: String
  field :birthday, type: Date
  field :address, type: String

  validates :first_name, presence: true,
                         length: { minimum: 1, maximum: 20 }
  validates :last_name, presence: true,
                        length: { minimum: 1, maximum: 20 }
  validates :address, presence: true,
                      length: { minimum: 1, maximum: 60 }

  def self.search(search_value)
    # binding.pry
    if search_value
      any_of(
        { first_name: /#{search_value}/i },
        { last_name: /#{search_value}/i },
        # { birthday: /#{Date.parse search_value}/},
        { address: /#{search_value}/i }
       )
    end
  end
end
