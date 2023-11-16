class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    # @movie = Movie.find(params[:movie_id])
  end

  def create
    @list = List.find(params[:list_id])
    # @bookmark.list = @list
    # @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.create(bookmark_params)
    # @bookmark.movie = @movie
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:movie_id])
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
