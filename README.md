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
@movie.ratings << Rating.new( 0.8 )
```
```ruby
# app/views/movies/show.html.haml
%h1= @movie.title
= render @movie.rating
```

<span class='rateable rating' data-value='0.85' data-votes='20' id='rating_new' itemprop='aggregateRating' itemscope itemtype='http://schema.org/AggregateRating'>
          <meta content='4.25' itemprop='ratingValue'>
          <meta content='5' itemprop='bestRating'>
          <meta content='0' itemprop='worstRating'>
          <meta content='20' itemprop='ratingCount'>
          <span class='rateable stars' data-value='0.85'><span class='rateable star' data-value='1.0'><span class='half_star rateable' data-value='1.0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.1" rel="nofollow">★</a></span><span class='half_star rateable' data-value='1.0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.2" rel="nofollow">★</a></span></span><span class='rateable star' data-value='1.0'><span class='half_star rateable' data-value='1.0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.3" rel="nofollow">★</a></span><span class='half_star rateable' data-value='1.0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.4" rel="nofollow">★</a></span></span><span class='rateable star' data-value='1.0'><span class='half_star rateable' data-value='1.0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.5" rel="nofollow">★</a></span><span class='half_star rateable' data-value='1.0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.6" rel="nofollow">★</a></span></span><span class='rateable star' data-value='1.0'><span class='half_star rateable' data-value='1.0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.7" rel="nofollow">★</a></span><span class='half_star rateable' data-value='1.0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.8" rel="nofollow">★</a></span></span><span class='rateable star' data-value='0.25'><span class='half_star rateable' data-value='0.5'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=0.9" rel="nofollow">★</a></span><span class='half_star rateable' data-value='0'><a data-method="post" href="/ratings?rating%5Brateable_id%5D=1&amp;rating%5Brateable_type%5D=Scene&amp;rating%5Brater_id%5D=1&amp;rating%5Bvalue%5D=1.0" rel="nofollow">☆</a></span></span></span>
          <span class='info'>
            <span class='value'>
              <span class='numerator' itemprop='ratingValue'>4.3</span>
              <span class='seperator'>out of</span>
              <span class='denominator' itemprop='bestRating'>5</span>
            </span>
            <span class='votes'>(<span itemprop='ratingCount'>20</span>
            <span>ratings</span>)</span>
          </span>
        </span>

    
## Contributing

1. Fork it ( https://github.com/[my-github-username]/rating_star/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
