/// Response models for the Image to PDF API.

/// API Response wrapper.
class ImagetopdfResponse {
  final String status;
  final dynamic error;
  final ImagetopdfData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  ImagetopdfResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory ImagetopdfResponse.fromJson(Map<String, dynamic> json) => ImagetopdfResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? ImagetopdfData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Image to PDF API.

class ImagetopdfData {
  String? pdfName;
  num? imageCount;
  num? pageCount;
  String? pageSize;
  String? orientation;
  num? margin;
  dynamic quality;
  num? size;
  num? expires;
  String? downloadURL;

  ImagetopdfData({
    this.pdfName,
    this.imageCount,
    this.pageCount,
    this.pageSize,
    this.orientation,
    this.margin,
    this.quality,
    this.size,
    this.expires,
    this.downloadURL,
  });

  factory ImagetopdfData.fromJson(Map<String, dynamic> json) => ImagetopdfData(
      pdfName: json['pdfName'],
      imageCount: json['imageCount'],
      pageCount: json['pageCount'],
      pageSize: json['pageSize'],
      orientation: json['orientation'],
      margin: json['margin'],
      quality: json['quality'],
      size: json['size'],
      expires: json['expires'],
      downloadURL: json['downloadURL'],
    );
}

class ImagetopdfRequest {
  List<String>? urls;
  String? pageSize;
  String? orientation;
  num? margin;

  ImagetopdfRequest({
    this.urls,
    this.pageSize,
    this.orientation,
    this.margin,
  });

  Map<String, dynamic> toJson() => {
      if (urls != null) 'urls': urls,
      if (pageSize != null) 'pageSize': pageSize,
      if (orientation != null) 'orientation': orientation,
      if (margin != null) 'margin': margin,
    };
}
