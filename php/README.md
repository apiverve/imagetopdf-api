# Image to PDF API - PHP Package

Image to PDF combines up to 20 images, uploaded or fetched from URLs, into one PDF with one image per page, and returns a download link valid for 2 days. Pages can match each image or be A4, Letter or Legal with a margin, and multi-page TIFF scans and animated GIFs become one page per frame.

## Installation

Install via Composer:

```bash
composer require apiverve/imagetopdf
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Imagetopdf\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'urls' => https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=1200,https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=1200,
    'pageSize' => 'a4',
    'orientation' => 'auto',
    'margin' => 10
]);

// Print the response
print_r($response);
```

### File Upload

```php
// Upload a file
$response = $client->executeWithFile('/path/to/file.jpg');

// Or use a URL
$response = $client->executeWithUrl('https://example.com/image.jpg');
```

### Error Handling

```php
use APIVerve\Imagetopdf\Client;
use APIVerve\Imagetopdf\Exceptions\APIException;
use APIVerve\Imagetopdf\Exceptions\ValidationException;

try {
    $response = $client->execute(['urls' => https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=1200,https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=1200, 'pageSize' => 'a4', 'orientation' => 'auto', 'margin' => 10]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/imagetopdf?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/imagetopdf?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/imagetopdf?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
