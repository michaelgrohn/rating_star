class RatingsController < ApplicationController

  def create
    Rating.create( rating_params )
  end

  private

    def rating_params
      params.require( :rating ).permit( :value, :rateable_id, :rateable_type, :rater_id )
    end

end
