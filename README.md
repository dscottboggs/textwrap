# textwrap
A simple library to wrap text to a given width.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     textwrap:
       github: dscottboggs/textwrap
   ```

2. Run `shards install`

## Usage

```crystal
require "textwrap"

some_long_string.wrap() # returns the wrapped string
```

## Development

Performance and functionality improvements are welcome.

## Contributing

1. Fork it (<https://github.com/dscottboggs/textwrap/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [D. Scott Boggs](https://github.com/dscottboggs) - creator and maintainer
