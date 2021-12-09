module Api
    module V1
        class ListsController < ApplicationController
            # Authenticate all of our posts routes
            # before_action :authorize_request
            before_action :authorized, only: [:auto_login]

            
            # This method returns all the Posts in the database
            def index 
                list = List.order('id ASC');
                render json: {
                    status: 'Success',
                    message: 'All Lists',
                    data: list,
                    },
                    status: :ok
            end

            # Create a new post
            def create
                list = List.new(list_params)
                    if list.save
                        render json: {
                            status: 'Success',
                            message: 'Lists saved',
                            data: list,
                            },
                            status: :created
                    else 
                        render json: {
                            status: 'Error',
                            message: 'List not saved',
                            data: list.errors,
                            },
                            status: :unprocessable_entity
                    end
            end

            # Returns a single post associated with that id
            def show
               list = List.find(params[:id])
                render json: {
                    status: 'Success',
                    message: 'Loaded List',
                    data: list,
                    },
                    status: :ok
                rescue ActiveRecord::RecordNotFound => e
                    render json: {
                        message: e
                    }, status: :not_found
            end

            # Update a post associted with that id in the database
            def update
                list = List.find(params[:id])
                if list.update(list_params)
                    render json: {
                        status: 'Success',
                        message: 'List updated',
                        data: list
                        },
                        status: :ok
                else 
                    render json: {
                        status: 'Success',
                        message: 'List not updated',
                        data: list,
                        },
                        status: :unprocessable_entity
                end
            end

            # Delete a post from the database
            def destroy
                list = List.find(params[:id])
                list.destroy
                render json: {
                    status: 'Success',
                    message: 'List deleted',
                    data: list,
                    },
                    status: :ok
            end

            private 
            def list_params
                params.permit(:id, :kategori)
            end
        end
    end
end