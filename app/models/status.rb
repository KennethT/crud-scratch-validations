class Status < ActiveRecord::Base
  validates :user, :status,  presence: true
end
