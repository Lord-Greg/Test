class ArticlesController < ApplicationController
	
	http_basic_authenticate_with(name:"admin", password:"cisco", except: [:index, :show])

	def index
		@artykul = Article.all
	end

	def show
		@artykul = Article.find(params[:id])
	end
		
	def new
		@artykul = Article.new()
	end

	def create
		@artykul = Article.new(zweryfikuj_artykul())
		if(@artykul.save)
			redirect_to @artykul
		else
			render "new"
		end
	end

	def destroy
		@artykul = Article.find(params[:id])
		@artykul.destroy()
		redirect_to(articles_path)
	end

	def edit
		@artykul = Article.find(params[:id])
	end

	def update
		@artykul = Article.find(params[:id])
		if(@artykul.update(zweryfikuj_artykul()))
			redirect_to @artykul
		else
			render "edit"
		end
	end

	private def zweryfikuj_artykul
		#params.require(:artykul).permit(:title, :text)
		params.require(:article).permit(:title, :text)
	end
end
