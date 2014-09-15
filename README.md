RatingStar ★★★★☆
=================

**This gem is in early alpha. No guarantee, it will install or work at all, at the moment.**

This extension adds easy and straight-forward rating functionality to your Rails app. It also comes with pre-defined views, for the ratings to be displayed as a set of stars.

Setup
------------------------------

### Installation

```ruby    
# Gemfile
gem 'rating_star', git: 'https://github.com/michaelgrohn/rating_star.git'
```

```shell
$ bundle
```

### Migration

```shell
$ rails generate ratings
$ rake db:migrate
```

### Model

```ruby
# app/models/movie.rb
is_rateable
```

Usage
------------------------------

```ruby
@movie = Movie.find_by( name: 'The Dark Knight' )
@movie.ratings.create( value: 0.9 ) # rating value ranges form 0..1
```

```ruby
# app/views/movies/show.html.haml
= render @movie.rating
```

This will render something like this ob your webpage:

![](https://raw.githubusercontent.com/michaelgrohn/rating_star/master/lib/rating_star/examples/example.png)

### Configurations

```ruby
# app/models/movie.rb
is_rateable by: :users
```

```ruby
# app/models/book.rb
is_rateable by: [ :users, :readers, … ]
```

```ruby
# app/models/user.rb
is_rater for: [ :movies, :books ]
```

```ruby
@movie.rating.vote_count
#=> 1
@movie.rating.value # average value, based on all votes
#=> 0.9

@movie.ratings.create( value: 0.8 )
@movie.rating.vote_count
#=> 2
@movie.rating.value
#=> 0.85

@user = User.find_by( name: "Michael" )
rating = @movie.ratings.create( value: 1.0, rater: @use )
rating.item.title
#=> "The Dark Knight"
rating.rater.name
#=> "Michael"
@user.rated_movies.first.title
#=> "The Dark Knight"
@movie.rating_users.first.name
#=> "Michael"

@user.rated_books.first.name
#=> "The Dark Tower"

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rating_star/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
