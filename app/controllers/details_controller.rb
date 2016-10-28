class DetailsController < ApplicationController
	def new
		@detail = Detail.new
	end

	def create
		@detail = Detail.new(detail_params)
		if @detail.save
		redirect_to detail_list_path
	else
		render "new"
		end 
	end

	def index
		@details = Detail.all
	end
	def edit
		@detail = Detail.find_by_id(params[:id])
	end

	def update
		# binding.pry
		@detail = Detail.find_by_id(params[:id])
		@detail.update_attributes(detail_params)
		redirect_to detail_list_path
	end
	def destroy
		@detail = Detail.find_by_id(params[:id])
		@detail.destroy
		redirect_to detail_list_path
	end

	def profile
		@detail = Detail.find_by_id(params[:id])
	end

	private
	def detail_params
		params.require(:detail).permit(:firstname, :lastname, :email, :password1)
	end
end
