# Examples to learn the difference between preload, includes or eager_load

Do you know "in theory" [the difference between "includes", "preload", "eager_load" and "joins"](https://bhserna.com/includes-preload-eager-load-joins-in-rails.html), but you still think that you need more examples to really understand how to use them?

Here you will find a set of examples to help you understand how you can use this 4 methods.

This is the code that I used for the [Examples to learn the difference between preload, includes or eager_load](https://bhserna.com/examples-to-learn-the-difference-between-preload-includes-eager-load.html).

On `lib/examples.rb` you will find a list of examples with:

* The description of a task
* The query written with ActiveRecord
* A function to write the results

You can use this code to play a little more and try different things.

## How to run the examples

1. **Create a postgres database** with `createdb preloading_examples`. As
   you can see the in `db/config.rb` the name of the database is hardcoded, so
   you will need to create a database with that name.

2. **Install the dependencies** with `bundle install`.

3. **Run the seeds** with `ruby db/seeds.rb`. You can also update the data that
   you want to use, there.

4. **Run the examples** with `ruby lib/examples.rb`.
