module Api
    module V1
        class ArtikelsController < ApplicationController
            # Authenticate all of our posts routes
            # before_action :authorize_request
            before_action :authorized, only: [:auto_login]

            
            # This method returns all the Posts in the database
            def index 
                artikel = Artikel.order('id ASC');
                render json: {
                    status: 'Success',
                    message: 'All Artikel',
                    data: artikel,
                    },
                    status: :ok
            end

            # Create a new post
            def create
                artikel = Artikel.new(artikel_params)
                    if artikel.save
                        render json: {
                            status: 'Success',
                            message: 'Artikel saved',
                            data: artikel,
                            },
                            status: :created
                    else 
                        render json: {
                            status: 'Error',
                            message: 'Artikel not saved',
                            data: artikel.errors,
                            },
                            status: :unprocessable_entity
                    end
            end

            # Returns a single post associated with that id
            def show
                artikel = Artikel.find(params[:id])
                render json: {
                    status: 'Success',
                    message: 'Loaded Artikel',
                    data: artikel,
                    },
                    status: :ok
                rescue ActiveRecord::RecordNotFound => e
                    render json: {
                        message: e
                    }, status: :not_found
            end

            # Update a post associted with that id in the database
            def update
                artikel = Artikel.find(params[:id])
                if artikel.update(artikel_params)
                    render json: {
                        status: 'Success',
                        message: 'Artikel updated',
                        data: artikel,
                        },
                        status: :ok
                else 
                    render json: {
                        status: 'Success',
                        message: 'Artikel not updated',
                        data: artikel,
                        },
                        status: :unprocessable_entity
                end
            end

            # Delete a post from the database
            def destroy
                artikel = Artikel.find(params[:id])
                artikel.destroy
                render json: {
                    status: 'Success',
                    message: 'Artikel deleted',
                    data: artikel,
                    },
                    status: :ok
            end

            private 
            def artikel_params
                params.permit(:id, :judul, :isi, :media)
            end
        end
    end
end