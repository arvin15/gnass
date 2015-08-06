class Author < ActiveRecord::Base
  validates :email, :first_name, :last_name, presence: true

  has_many :documents, dependent: :destroy
end
