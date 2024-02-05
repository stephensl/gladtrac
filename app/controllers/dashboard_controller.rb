class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Display the dashboard view for authenticated users
    # The view 'dashboard/index.html.erb' will be rendered
  end

  def student_profile
    @student = Student.find(params[:id])
    @transcripts = @student.transcripts.includes(:courses) # Assuming a student has_many :transcripts and a transcript has_many :courses
  end
end
