class Api::ArticlesController < ApplicationController
    http_basic_authenticate_with name: "Admin", password: "Admin", only: :index

    def index
      @article = Article.all
        respond_to do |format|
        format.html
        format.json {render json: @article.to_json}
      end
    end
end
