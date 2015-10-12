class User < ActiveRecord::Base
  has_one :bio
	scope :like, ->(args) { where("email like '%#{args}%' OR name like '%#{args}%' OR surname like '%#{args}%'")}
end
