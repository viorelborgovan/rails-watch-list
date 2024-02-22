class BookmarksController < ApplicationController
  before_action set_bookmark only: :destroy
  before_action set_list only: [:new, :create]

  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to lists_path(@list)
  end

  def destroy
    @bookmark = @bookmark.destroy
    redirect to list_path(@bookmark_list)
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)

    def set_list
      @list = List.find(params[:list_id])
    end
  end


end
