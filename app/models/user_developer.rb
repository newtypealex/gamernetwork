class UserDeveloper < ActiveRecord::Base
  belongs_to :developer
  belongs_to :user
end
