class Api::V1::AuthorsController < ApplicationController
  respond_to :json

  def show
    respond_with Author.find(params[:id])
  end

  def index
    params[:per_page] = 10 unless params[:per_page]
    items = Author.search(params).page(params[:page]).per(params[:per_page])
    render json: items, meta: { pagination:
                                   { per_page: params[:per_page],
                                     pages: items.total_pages,
                                     items: items.total_count } }
  end

  def create
    author = Author.new(params_parser)
    if author.save
      render json: author, status: 201, location: [:api, author]
    else
      render json: {errors: author.errors}, status: 422
    end
  end

  def update
    author = Author.find(params[:id])
    if author.update(params_parser)
      render json: author, status: 201, location: [:api, author]
    else
      render json: {errors: author.errors}, status: 422
    end
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    head 204
  end

  private
    def params_parser
      params.require(:author).permit(:email, :first_name, :last_name)
    end
end
