class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def create
    @comment = Comment.create(comment_params)
    render json: @comment
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      render json: @comments
    else
      render json: { error: "No se pudo crear el comentario" }
    end
  end

  def destroy
    Coment.find(params[:id]).destroy
    render head :no_content
  end
end
