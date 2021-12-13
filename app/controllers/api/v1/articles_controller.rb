module Api
    module V1
        class ArticlesController < ApplicationController
            # Authenticate all of our posts routes
            # before_action :authorize_request
            before_action :authorized, only: [:auto_login]
            
            # This method returns all the Posts in the database
            def index 
                article = Article.order('id ASC').page(params[:page]).per(params[:per_page]);
                render json: {
                    status: 'Success',
                    message: 'All article',
                    data: article,
                    meta: {
                        count: article.count,
                        total: article.total_pages
                    }
                },
                    status: :ok
            end

            # Create a new post
            def create
                article = Article.new(article_params)
                    if article.save
                        render json: {
                            status: 'Success',
                            message: 'Article Saved',
                            data: article,
                            },
                            status: :created
                    else 
                        render json: {
                            status: 'Error',
                            message: 'Article Not Saved',
                            data: article.errors,
                            },
                            status: :unprocessable_entity
                    end
            end

            # Returns a single post associated with that id
            def show
                article = Article.find(params[:id])
                render json: {
                    status: 'Success',
                    message: 'Loaded Article',
                    data: article,
                    },
                    status: :ok
                rescue ActiveRecord::RecordNotFound => e
                    render json: {
                        message: e
                    }, status: :not_found
            end

            # Update a post associted with that id in the database
            def update
                article = Article.find(params[:id])
                if article.update(article_params)
                    render json: {
                        status: 'Success',
                        message: 'Article Updated',
                        data: article,
                        },
                        status: :ok
                else 
                    render json: {
                        status: 'Success',
                        message: 'Article Not Updated',
                        data: article,
                        },
                        status: :unprocessable_entity
                end
            end

            # Returns a single post associated with that id
            def search
                article = Article.where("title LIKE ? ", "%#{params[:title]}%")
                render json: {
                    status: 'Searching Success',
                    message: 'Results (if empty = not found)',
                    data: article,
                    },
                    status: :ok
                rescue ActiveRecord::RecordNotFound => e
                    render json: {
                        message: e
                    }, status: :not_found
            end

            # Delete a post from the database
            def destroy
                article = Article.find(params[:id])
                article.destroy
                render json: {
                    status: 'Success',
                    message: 'article deleted',
                    data: article,
                    },
                    status: :ok
            end

            private 
            def article_params
                params.permit(:id, :title, :body, :media)
            end
            def search_params
                params.permit(:title)
            end
        end
    end
end