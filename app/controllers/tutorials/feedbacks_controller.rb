class Tutorials::FeedbacksController < ApplicationController
  def new
    slug = params[:slug]
    @tutorial = Tutorial.find_by slug: slug
  end

  def create
    tutorial_id = feedback_params[:tutorial_id]
    tutorial = Tutorial.find(tutorial_id)

    feedback_content = feedback_params[:content]
    feedback = tutorial.feedbacks.create(content: feedback_content)
    redirect_to "/tutorials/#{tutorial.slug}/feedbacks"
  end

  def index
    slug = params[:slug]
    @tutorial = Tutorial.find_by slug: slug
  end

  private
  def feedback_params
    params.require(:feedback).permit(:content, :tutorial_id)
  end
end
