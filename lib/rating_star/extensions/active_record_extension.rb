module ActiveRecordExtension

  extend ActiveSupport::Concern

  module ClassMethods

    def is_rateable( opts = {} )
      include Rateable

      Array( opts[ :by ] ).each do |rater|
        has_many "rating_#{ rater.to_s.pluralize }".to_sym,
                 through: :ratings, source: :rater, source_type: rater.to_s.singularize.camelize
      end
    end

    def is_rater( opts = {} )
      include Rater

      Array( opts[ :for ] ).each do |item|
        has_many "rated_#{ item.to_s.pluralize }".to_sym,
                 through: :ratings, source: :item, source_type: item.to_s.singularize.camelize
      end
    end
  end
end

ActiveRecord::Base.send( :include, ActiveRecordExtension )
