class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String price;
  final String currency;
  final String image;
  final Map<String, String> specs;

  const Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.currency,
    required this.image,
    required this.specs,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final rawSpecs = json['specs'] as Map<String, dynamic>? ?? {};
    final parsedSpecs = rawSpecs.map(
      (key, value) => MapEntry(key, value.toString()),
    );

    return Product(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      tagline: json['tagline'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as String? ?? '',
      currency: json['currency'] as String? ?? 'USD',
      image: json['image'] as String? ?? '',
      specs: parsedSpecs,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'description': description,
      'price': price,
      'currency': currency,
      'image': image,
      'specs': specs,
    };
  }

  String get localImagePath {
    final fileName = image.split('/').last;
    return 'assets/images/products/$fileName';
  }

  double get numericPrice {
    final cleaned = price.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  String get category {
    final lower = name.toLowerCase();
    if (lower.contains('iphone')) return 'iPhone';
    if (lower.contains('macbook') || lower.contains('imac')) return 'Mac';
    if (lower.contains('ipad')) return 'iPad';
    if (lower.contains('watch')) return 'Watch';
    if (lower.contains('airpods') || lower.contains('homepod')) return 'Audio';
    return 'Other';
  }
}
