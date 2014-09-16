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

Quickstart
------------------------------

```ruby
# app/models/movie.rb
is_rateable
```

```ruby
@movie = Movie.find_by( title: 'The Dark Knight' )
@movie.ratings.create( value: 0.9 )
```

```ruby
# app/views/movies/show.html.haml
# ⋮
= render @movie.rating
# ⋮
```

This will render something like this on your webpage:

![](https://raw.githubusercontent.com/michaelgrohn/rating_star/master/lib/rating_star/examples/example.png)

Usage
------------------------------

### Models and Controllers

Specify attributions, to easily reference the correspondending model later (not mandatory):

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

Accessing `.rating` on a model gives you the average rating, based on all votes. The ratings `.value` is the actual rating value and ranges form 0..1. `.vote_count` is the count of given ratings. If it is greater than 1, the rating represents an average rating.

```ruby
@movie.rating.vote_count
#=> 1
@movie.rating.value
#=> 0.9

@movie.ratings.create( value: 0.8 )
@movie.rating.vote_count
#=> 2
@movie.rating.value
#=> 0.85
```

Ways to access your models:

```ruby
@movie.ratings
#=> a collection of all ratings
@movie.rating
#=> the average rating (a new object)

@user = User.first
@rating = @movie.ratings.create( value: 1.0, rater: @user )

@rating.rater
#=> the object that gave this rating (nil if not specified)
@rating.item
#=> the object that is being rated

@movie.rating_users # must have specified is_rateable by: :users
#=> a collection of all the users that gave this movie a rating
@user.rated_movies # must have specified is_rater for: :movies
#=> a collection of all movies, that this user has rated
@user.rated_books # must have specified is_rater for: :books
#=> a collection of all books, that this user has rated
@user.rated_books( min: 0.5, max: 0.8 ) # must have specified is_rater for: :books
#=> a collection of all books, that this user has rated with a rating between 0.5 and 0.8
```

### Views

Simply render the rating as stars:

```ruby
= render @movie.rating # 5 stars default
= render @movie.rating, scale: 4 # 4 stars system
= render @movie.rating, scale: 11 # ours goes up to 11! 
```

Enable rating by clicking on the stars:

```ruby
= render @movie.rating, rateable: true
= render @movie.rating, rateable: true, rater: current_user
```

Show additional information under the stars:

```ruby
= render @movie.rating, with_vote_count: true
= render @movie.rating, with_value: true # adds "4.5 out of 5"
```

Contributing
------------------------------

1. Fork it ( https://github.com/[my-github-username]/rating_star/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
