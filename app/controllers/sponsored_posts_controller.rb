class SponsoredPostsController < ApplicationController
	before_action :set_topic

	def index
     @sponsored_posts = SponsoredPost.all
   end

   def show
     @sponsored_post = SponsoredPost.find(params[:id])
   end

   def new
     @sponsored_post = SponsoredPost.new
   end 

   def create
     @sponsored_post = SponsoredPost.new
     @sponsored_post.title = params[:sponsored_post][:title]
     @sponsored_post.body = params[:sponsored_post][:body]
     @sponsored_post.topic = @topic

     @sponsored_post.price = params[:sponsored_post][:price]
 
     if @sponsored_post.save
       redirect_to [@topic, @sponsored_post], notice: "Sponsored post was saved successfully."
     else
       flash.now[:alert] = "Error creating sponsored post. Please try again."
       render :new
     end
   end

   def edit
     @sponsored_post = SponsoredPost.find(params[:id])
   end

   def update
     @sponsored_post = SponsoredPost.find(params[:id])
 
     @sponsored_post.title = params[:sponsored_post][:title]
     @sponsored_post.body = params[:sponsored_post][:body]
     @sponsored_post.price = params[:sponsored_post][:price]
 
     if @sponsored_post.save
        flash[:notice] = "Sponsored post was updated."
       redirect_to [@topic, @sponsored_post]
     else
       flash.now[:alert] = "Error saving sponsored post. Please try again."
       render :edit
     end
   end

   def destroy
     @sponsored_post = SponsoredPost.find(params[:id])
 
     if @sponsored_post.destroy
       flash[:notice] = "\"#{@sponsored_post.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the sponsored post."
       render :show
     end
   end

   private

   def set_topic
   		@topic = Topic.find(params[:topic_id])
   end
end
