class Document < ActiveRecord::Base
  validates :title, :id_book, presence: true
  validates :id_book, uniqueness: true

  belongs_to :author
  has_many :comments, dependent: :destroy

  scope :filter_by_title, lambda {|keyword|
    where("lower(title) LIKE ?", "%#{keyword.downcase}%")
  }

  scope :filter_by_book_id, lambda {|keyword|
    where("lower(id_book) LIKE ?", "%#{keyword.downcase}%")
  }

  def self.search(params = {})

    documents = params[:document_ids].present? ? Document.where(id: params[:document_ids]) : Document.all

    documents = documents.filter_by_title(params[:title]) if params[:title]
    documents = documents.filter_by_book_id(params[:id_book]) if params[:id_book]

    documents
  end
end
