class TherapistsController < ApplicationController
  def index
    @therapists = Therapist.all
    apply_filters
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def apply_filters
    @therapists = @therapists.where(insurance: params[:insurance]) if params[:insurance].present?
    @therapists = @therapists.where(remote: params[:remote]) if params[:remote].present?
    @therapists = @therapists.where(location: params[:location]) if params[:location].present?
  end
end
