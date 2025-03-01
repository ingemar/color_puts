# ColorPuts
Colorize your output with markdown inspired syntax

## Installation
With Bundler:
```ruby
gem "color_puts"
```

## Usage
Example:
```ruby
ColorPuts.colorize(<<~TEXT)
  A (bold)[bold], (bright_red)[bright red boat] with an (#FF8000)[orange sail] was
  sailing (on_blue)[on a blue sea] with (rainbow)[a rainbow in the background].
TEXT
```

## Colors
The colorization is done with [Sai](https://github.com/aaronmallen/sai),
so you can use any style it supports or any color name in its registry.

## Contributing

Contributions are welcome!
