# timeo.badminton

A Jekyll-based website supporting Timéo Bourgin's Olympic badminton dream.

## Setup

```bash
bundle install
bundle binstubs rake jekyll rspec-core --force
```

## Development

```bash
# Serve locally
bundle exec jekyll serve

# Build the site
./bin/jekyll build
```

## Testing

This project includes comprehensive automated testing:

### Run All Tests
```bash
./bin/rake test
```

This will:
1. Build the Jekyll site
2. Run RSpec unit tests
3. Validate HTML and check for broken links

### Run Individual Test Suites

```bash
# Build only
./bin/rake build

# RSpec only
./bin/rspec

# HTML validation only
./bin/rake html_proofer
```

### Test Coverage

The test suite includes:
- **Build Validation**: Ensures Jekyll builds successfully and generates all required files
- **Content Validation**: Verifies configuration, front matter, and content quality
- **HTML Validation**: Checks for valid HTML structure and broken links
- **SEO Checks**: Validates metadata and SEO-critical elements

For more details, see [TEST_COVERAGE_ANALYSIS.md](TEST_COVERAGE_ANALYSIS.md).

## CI/CD

GitHub Actions automatically runs all tests on every push and pull request. See `.github/workflows/test.yml`.

## License

See [LICENSE](LICENSE) file.
