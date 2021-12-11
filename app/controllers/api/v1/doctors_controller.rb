module Api
    module V1
        class DoctorsController < ApplicationController
            # Authenticate all of our posts routes
            # before_action :authorize_request
            before_action :authorized, only: [:auto_login]

            
            # This method returns all the Posts in the database
            def index 
                doctor = Doctor.order('id ASC');
                render json: {
                    status: 'Success',
                    message: 'All Lists',
                    data: doctor,
                    },
                    status: :ok
            end

            # Create a new post
            def create
                doctor = Doctor.new(doctor_params)
                    if doctor.save
                        render json: {
                            status: 'Success',
                            message: 'Doctor saved',
                            data: doctor,
                            },
                            status: :created
                    else 
                        render json: {
                            status: 'Error',
                            message: 'List not saved',
                            data: doctor.errors,
                            },
                            status: :unprocessable_entity
                    end
            end

            # Returns a single post associated with that id
            def show
               doctor = Doctor.find(params[:id])
                render json: {
                    status: 'Success',
                    message: 'Loaded List',
                    data: doctor,
                    },
                    status: :ok
                rescue ActiveRecord::RecordNotFound => e
                    render json: {
                        message: e
                    }, status: :not_found
            end

            # Update a post associted with that id in the database
            def update
                doctor = Doctor.find(params[:id])
                if doctor.update(doctor_params)
                    render json: {
                        status: 'Success',
                        message: 'List updated',
                        data: doctor,
                        },
                        status: :ok
                else 
                    render json: {
                        status: 'Success',
                        message: 'List not updated',
                        data: doctor,
                        },
                        status: :unprocessable_entity
                end
            end

            # Returns a single post associated with that id
            def search
                doctor = Doctor.where("fullname LIKE ? ", "%#{params[:fullname]}%")
                render json: {
                    status: 'Success',
                    message: 'Results Doctor Search',
                    data: doctor,
                    },
                    status: :ok
                rescue ActiveRecord::RecordNotFound => e
                    render json: {
                        message: e
                    }, status: :not_found
            end

            # Delete a post from the database
            def destroy
                doctor = Doctor.find(params[:id])
                doctor.destroy
                render json: {
                    status: 'Success',
                    message: 'Doctor Deleted.',
                    data: doctor,
                    },
                    status: :ok
            end

            private 
            def doctor_params
                params.permit(:id, :fullname, :PracticeLocation, :specialist, :profile, :avatar)
            end
            def search_params
                params.permit(:fullname)
            end
        end
    end
end