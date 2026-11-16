# Image to PDF API - Dart/Flutter Client

Image to PDF combines up to 20 images, uploaded or fetched from URLs, into one PDF with one image per page, and returns a download link valid for 2 days. Pages can match each image or be A4, Letter or Legal with a margin, and multi-page TIFF scans and animated GIFs become one page per frame.

[![pub package](https://img.shields.io/pub/v/apiverve_imagetopdf.svg)](https://pub.dev/packages/apiverve_imagetopdf)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Image to PDF API](https://apiverve.com/marketplace/imagetopdf?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_imagetopdf: ^1.2.6
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_imagetopdf/apiverve_imagetopdf.dart';

void main() async {
  final client = ImagetopdfClient('YOUR_API_KEY');

  try {
    // This API requires a file upload — a JSON body is rejected with a 400.
    final response = await client.executeWithFile('/path/to/your-file');

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [Image to PDF API](https://apiverve.com/marketplace/imagetopdf?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/imagetopdf](https://docs.apiverve.com/ref/imagetopdf?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
