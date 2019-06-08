class BooksController < ApplicationController
before_action :authenticate_user!,only:[:new, :create, :index, :show, :edit, :update, :destroy]
	def top
		render "books/top"
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
	  if @book.save
	  	flash[:notice] = "You have created book successfully."
		redirect_to book_path(@book.id)

	  else
	  	@books = Book.all
		render 'books/index'
	  end
		
	end

	def index
		@books = Book.all
        @book = Book.new
        @user = current_user
	end

	def show

	    @newbook = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit

		@book = Book.find(params[:id])
		if @book.user.id != current_user.id
			redirect_to books_path
		end
	end

	def update

		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to book_path(@book.id)
	end

	def destroy

		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
		
	end

	private
	def book_params
		params.require(:book).permit(:book_title, :text, :caption, :book_id)
		
	end
end