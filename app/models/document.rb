class Document < ActiveRecord::Base
  validates :title, :id_book, presence: true

  belongs_to :author
  has_many :comments, dependent: :destroy
end
