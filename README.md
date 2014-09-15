# RatingStar ★★★★☆

This extension adds easy and straight-forward rating functionality to your Rails app. It also comes with pre-defined views, for the ratings to be displayed as a set of stars.

## Installation

    # Gemfile
    gem 'rating_star', git: 'https://github.com/michaelgrohn/rating_star.git'


    $ bundle

## Setup

### Migration

    rails generate ratings
    rake db:migrate

### Model

    # app/models/movie.rb
    is_rateable

That's it! 😃

## Usage

    @movie = Movie.find_by name: 'The Dark Knight'
    @movie.ratings << Rating.new( 0.8 )

    # app/views/movies/show.html.haml
    %h1= @movie.title
    = render @movie.rating

    ★★★★☆

    
## Contributing

1. Fork it ( https://github.com/[my-github-username]/rating_star/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
