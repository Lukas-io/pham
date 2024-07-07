class ProductEntity {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final double rating;
  final int reviews;
  final int? quantity;

  ProductEntity({
    this.quantity,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.reviews,
  });
}
