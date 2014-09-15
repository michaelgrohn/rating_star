# RatingStar ★★★★☆

This extension adds easy and straight-forward rating functionality to your Rails app. It also comes with pre-defined views, for the ratings to be displayed as a set of stars.

## Installation

```ruby    
# Gemfile
gem 'rating_star', git: 'https://github.com/michaelgrohn/rating_star.git'
```
```shell
$ bundle
```

## Setup

### Migration
```shell
rails generate ratings
rake db:migrate
```

### Model
```ruby
# app/models/movie.rb
is_rateable
```

That's it! 😃

## Usage
```ruby
@movie = Movie.find_by name: 'The Dark Knight'
@movie.ratings << Rating.new( 0.9 )
```
```ruby
# app/views/movies/show.html.haml
...
= render @movie.rating
...
```

This will render something like this:

![](https://raw.githubusercontent.com/michaelgrohn/rating_star/master/lib/rating_star/examples/example.png)

    
## Contributing

1. Fork it ( https://github.com/[my-github-username]/rating_star/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
