class Author < ActiveRecord::Base
  validates :first_name, presence: true

  has_many :documents, dependent: :destroy

  def full_name
     "#{first_name} #{last_name}"
  end

  scope :filter_by_email, lambda {|keyword|
    where("email LIKE ?", "%#{keyword}%")
  }

  scope :filter_by_name, lambda {|keyword|
    where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", "%#{keyword.downcase}%","%#{keyword.downcase}%")
  }

  def self.search(params = {})

    authors = params[:author_ids].present? ? Author.where(id: params[:author_ids]) : Author.all

    authors = authors.filter_by_email(params[:email]) if params[:email]
    authors = authors.filter_by_name(params[:name]) if params[:name]

    authors
  end

end
