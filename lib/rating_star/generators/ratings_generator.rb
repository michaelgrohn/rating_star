require 'rails/generators'
require 'rails/generators/base'

class RatingsGenerator < Rails::Generators::Base
  
  source_root File.expand_path( 'templates', __dir__ )

  def create_migration_files
    copy_file "db/migrate/create_ratings.rb",
              "db/migrate/#{ Time.now.strftime( '%Y%m%d%H%M%S' ) }_create_ratings.rb"
  end

  def create_app_files
    copy_all  'app/models'
    copy_all  'app/controllers'
    copy_all  'app/views'
    copy_all  'app/assets'
  end

  def create_lib_files
    copy_all  'lib'
    application 'config.autoload_paths += Dir[ "#{ config.root }/lib/rating_star/**/" ]'
    application 'config.autoload_paths += %W( #{ config.root }/lib/rating_star )'
  end

  private

    def copy_all( path )
      Dir.chdir( self.class.source_root ) do
        Dir.glob( File.join( path, '**', '*' ) ).each do |file|
          copy_file( file ) unless File.directory?( file )
        end
      end
    end
end
