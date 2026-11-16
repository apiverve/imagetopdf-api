# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_imagetopdf"
  spec.version       = "1.2.6"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Image to PDF API - Ruby Client"
  spec.description   = "Image to PDF combines up to 20 images, uploaded or fetched from URLs, into one PDF with one image per page, and returns a download link valid for 2 days. Pages can match each image or be A4, Letter or Legal with a margin, and multi-page TIFF scans and animated GIFs become one page per frame."
  spec.homepage      = "https://apiverve.com/marketplace/imagetopdf?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/imagetopdf-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/imagetopdf"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
