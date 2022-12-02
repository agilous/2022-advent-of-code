# Advent of Code 2022
My solutions for the [2022 Advent of Code](https://adventofcode.com/2022)
Challenge. [Here](https://github.com/topics/advent-of-code-2022?l=ruby) are
other Ruby based submissions. Also, I'm beginning to investigate
[Rust](https://github.com/topics/advent-of-code-2022?l=rust).

## Requirements
* Ruby 3.1.2
* A recent version of git

## Setup
With the requirements above run the following in a terminal:
```shell
git clone git@github.com:agilous/2022-advent-of-code.git
cd 2022-advent-of-code
./bin/setup
```

## Usage
Substituting the desired day (01-25) for 'XX' below, in a terminal run:
```shell
irb -r ./day_XX/day_XX.rb
```
In the resulting irb session run:
```ruby
DayXX.new.solution
```

## Benchmarks
In a terminal run:
```shell
./bin/benchmark
```

## Testing
If the desired day has specs then substituting the desired day (01-25) for 'XX'
below, in a terminal run:
```shell
ruby ./day_XX/day_XX_spec.rb
```
