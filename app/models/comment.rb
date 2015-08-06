class Comment < ActiveRecord::Base
  validates :message, :document_id , presence: true

  belongs_to :document
end
