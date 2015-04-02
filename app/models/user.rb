class User < ActiveRecord::Base
	scope :like, ->(args) { where("email like '%#{args}%' OR name like '%#{args}%' OR surname like '%#{args}%'")}
end