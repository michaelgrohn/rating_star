module EnumerableExtension

  extend ActiveSupport::Concern

  def common &block
    map( &block ).inject( :& )
  end

  def combined &block
    map( &block ).inject( :| )
  end

end

Enumerable.send( :include, EnumerableExtension )
