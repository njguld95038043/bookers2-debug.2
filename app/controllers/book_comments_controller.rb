class BookCommentsController < ApplicationController

  def create
   @book = Book.find(params[:book_id])
   comment = current_user.book_comments.new(book_comment)
   comment.book_id = @book.id
   comment.save
  end

  def destroy
    BookComment.find(params[:id]).destroy
  end


  private

  def book_comment
    params.require(:book_comment).permit(:comment)
  end

end
