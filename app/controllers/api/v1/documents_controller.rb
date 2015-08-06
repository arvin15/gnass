class Api::V1::DocumentsController < ApplicationController
  respond_to :json

  def show
    respond_with Document.find(params[:id])
  end

  def index
    params[:per_page] = 10 unless params[:per_page]
    items = Document.search(params).page(params[:page]).per(params[:per_page])
    render json: items, meta: { pagination:
                                   { per_page: params[:per_page],
                                     pages: items.total_pages,
                                     items: items.total_count } }
  end

  def create
    document = Document.new(params_parser)
    if document.save
      render json: document, status: 201, location: [:api, document]
    else
      render json: {errors: document.errors}, status: 422
    end
  end

  def update
    document = Document.find(params[:id])
    if document.update(params_parser)
      render json: document, status: 201, location: [:api, document]
    else
      render json: {errors: document.errors}, status: 422
    end
  end

  def destroy
    document = Document.find(params[:id])
    document.destroy
    head 204
  end

  private
    def params_parser
      params.require(:document).permit(:title, :body, :tags, :company, :picture, :is_active, :id_book, :author)
    end
end
