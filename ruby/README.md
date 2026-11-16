# Image to PDF API - Ruby Gem

Image to PDF combines up to 20 images, uploaded or fetched from URLs, into one PDF with one image per page, and returns a download link valid for 2 days. Pages can match each image or be A4, Letter or Legal with a margin, and multi-page TIFF scans and animated GIFs become one page per frame.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_imagetopdf'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_imagetopdf
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_imagetopdf'

# Initialize the client
client = APIVerve::Imagetopdf::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  urls: https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=1200,https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=1200,
  pageSize: "a4",
  orientation: "auto",
  margin: 10
})

# Print the response
puts response
```

### File Upload

```ruby
# Upload a file
response = client.execute_with_file("/path/to/file.jpg")

# Or use a URL
response = client.execute_with_url("https://example.com/image.jpg")
```

### Error Handling

```ruby
begin
  response = client.execute({ urls: https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=1200,https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=1200, pageSize: "a4", orientation: "auto", margin: 10 })
  puts response["data"]
rescue APIVerve::Imagetopdf::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Imagetopdf::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Imagetopdf::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "pdfName": "7c1e4b9a-2f3d-4e8a-9b6c-5d0a1f2e3c4b.pdf",
    "imageCount": 2,
    "pageCount": 2,
    "pageSize": "a4",
    "orientation": "auto",
    "margin": 10,
    "quality": null,
    "size": 483291,
    "expires": 1792400000000,
    "downloadURL": "https://storage.googleapis.com/apiverve/APIData/imagetopdf/7c1e4b9a-2f3d-4e8a-9b6c-5d0a1f2e3c4b.pdf?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1792400000&Signature=SAMPLE"
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/imagetopdf?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/imagetopdf?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/imagetopdf?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
