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
@movie.ratings.create( value: 0.9 ) # rating value ranges form 0..1
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

Accessing `.rating` on a model gives you the average rating, based on all votes. A rating has 2 main attributes: `value` and `vote_count`. The `Value` is the actual rating value - a `BigDecimal` that ranges form `0..1`. The`vote_count` reflects the count of given ratings.

```ruby
@movie.rating.vote_count
#=> 1
@movie.rating.value
#=> 0.9
```

If the `vote_count` is 1, the rating represents a single rating. If it is greater than 1, the rating represents an average rating, based on `vote_count` many other ratings.


```ruby
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
#=> a new average rating

@user = User.find_by( name: "Michael" )
@rating = @movie.ratings.create( value: 1.0, rater: @user )

@rating.rater.name
#=> "Michael"
@rating.item.title
#=> "The Dark Knight"

@movie.rating_users.first.name
#=> "Michael"
@user.rated_movies.first.title
#=> "The Dark Knight"
@user.rated_books.first.title
#=> "The Dark Tower"
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
