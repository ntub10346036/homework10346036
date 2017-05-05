class BooksController < ApplicationController
  def index 
    @books = Book.all
  end
  
  def edit
      @book = Book.find_by(id: params[:id])
  end
  
  def update
      @book = Book.find_by(id: params[:id])

      if @book.update(book_params)
        # 成功
        redirect_to books_path, notice: "資料更新成功!"
      else
        # 失敗
        render :edit
      end
   end
  
  def new
    @book = Book.new
  end
  
  def create
      @book = Book.new(book_params)
      if @book.save
         redirect_to books_path, notice: "added!"
      else
         render 'new'
      end
   end
  
  def destroy
      @book = Book.find_by(id: params[:id])
      @book.destroy if @book
      redirect_to books_path, notice: "候選人資料已刪除!"
  end
 
  private
  def book_params
     params.require(:book).permit(:title, :indroduction, :author, :price)
  end
end
