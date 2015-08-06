class Api::V1::CommentsController < ApplicationController
  respond_to :json

  def show
    respond_with Comment.find(params[:id])
  end

  def index
    respond_with Comment.all;
  end

  def create
    comment = Comment.new(params_parser)
    if comment.save
      render json: comment, status: 201, location: [:api, comment]
    else
      render json: {errors: comment.errors}, status: 422
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(params_parser)
      render json: comment, status: 201, location: [:api, comment]
    else
      render json: {errors: comment.errors}, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    head 204
  end

  private
    def params_parser
      params.require(:comment).permit(:message, :document_id)
    end
end
