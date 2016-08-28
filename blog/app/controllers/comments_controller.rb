class CommentsController < ApplicationController

	http_basic_authenticate_with(name:"admin", password:"cisco", only: :destroy)

	def create
		@artykul = Article.find(params[:article_id])
		@komentarz = @artykul.comments.create(weryfikuj_komentarz())
		redirect_to article_path(@artykul)
	end

	def destroy
		@artykul = Article.find(params[:article_id])
		@comment = @artykul.comments.find(params[:id])
		@comment.destroy()
		redirect_to article_path(@artykul)
	end

	private def weryfikuj_komentarz
		params.require(:comment).permit(:name, :body)
	end
end
