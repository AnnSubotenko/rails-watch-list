class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to create_path(@create)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
