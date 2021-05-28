class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    # bind to the list controller
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # nesting to work on
    # receive the param movie_id
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to lists_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
