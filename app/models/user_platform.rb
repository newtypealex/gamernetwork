class UserPlatform < ActiveRecord::Base
  belongs_to :platform
  belongs_to :user
end
