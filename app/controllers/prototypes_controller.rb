class PrototypesController < ApplicationController
	before_action :set_prototype, only: [:edit, :show, :update]
	before_action :authenticate_user!, expept: [:index, :destroy]
	before_action :move_to_insdex, only: [:edit]

	def index
		@prototypes = Prototype.all
	end

	def new
		@prototype = Prototype.new
	end

	def create
		@prototype = Prototype.new(prototype_params)
		if @prototype.save
		redirect_to root_path
		else
		render :new_prototype_path
	  end
	end

	def show
		@comment = Comment.new
		@comments = @prototype.comments
	end

	def edit
		@prototype = Prototype.find(params[:id])
	end

	def update
		if @prototype = Prototype.update(prototype_params)
			redirect_to prototype_path(@prototype)
		else
			render :edit
		end
	end

	def destroy
		 if @prototype= Prototype.find(params[:id])
			@prototype.destroy
			  redirect_to root_path
		else
		  redirect_to root_path
	  end
  end

	private
	def prototype_params
		params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
	end

	def set_prototype
		@prototype = Prototype.find(params[:id])
	end

	def move_to_insdex
		unless user_signed_in?
			redirect_to action: :index
		end
	end
end
