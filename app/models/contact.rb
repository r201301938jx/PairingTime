class Contact < ApplicationRecord

  validates :name, :email, :message, presence: true
  validates :name, length: {maximum: 20, minimum: 2}
  validates :message, length: {maximum: 300, minimum: 10}

end
