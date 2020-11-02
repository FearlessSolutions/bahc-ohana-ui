class AnalyticsController < ApplicationController
  respond_to :json

  def all
    homepage_views = Ahoy::Visit.where(landing_page: ENV['HOMEPAGE_URL']).count

    params[:start_date] # reasonable defaults?
    params[:end_date] # reasonable defaults?

    new_homepage_views = Ahoy::Visit.where(landing_page: ENV['HOMEPAGE_URL']).where(inserted_at: start_end...end_date).count

    respond_with {
      homepage_views: homepage_views,
      new_homepage_views: new_homepage_views
    }
  end
end
