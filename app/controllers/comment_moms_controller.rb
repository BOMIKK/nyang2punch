class CommentMomsController < ApplicationController
  def create
     @token=form_authenticity_token
    comment = CommentMom.new
    comment.content = params[:input_content]
    comment.mom_id = params[:mom_id]
    comment.user_id = params[:user_id]
    comment.save
    redirect_to "/moms/#{comment.mom.id}"
 
 
    
  end

  def update
    comment = CommentMom.find params[:id]
    comment.title = params[:input_title]
    comment.save
    redirect_to "/moms/#{comment.mom.id}"
    
    
  end
  
  def destroy
    comment = CommentMom.find params[:id]
    comment.destroy
    
    redirect_to "/moms/#{comment.mom.id}" 
  end
end
