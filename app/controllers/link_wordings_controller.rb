class LinkWordingsController < ApplicationController
	def index
		@wording = FetLinkWording.first
	end

	def edit
		@wording = FetLinkWording.first
	end

	def update
		@wording = FetLinkWording.first
		@wording.update(event_params)
	  redirect_to :action => :index
	end

	private

	def event_params
	  params.require(:fet_link_wording).permit(:review_wording, :product_wording)
	end

end
