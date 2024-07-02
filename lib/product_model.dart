import 'package:flutter/cupertino.dart';

class ProductModel extends ChangeNotifier {
  final String name;
  final double price;
  final String imagePath;
  final String description;
  final double rating;
  final int reviews;
  int quantity;
  bool bookmark;
  bool inCart;

  ProductModel({
    this.inCart = false,
    this.quantity = 0,
    this.bookmark = false,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.rating,
    required this.reviews,
  });

  void addQuantity() {
    this.quantity++;
    notifyListeners();
  }

  void minusQuantity() {
    if (this.quantity > 0) {
      this.quantity--;
      notifyListeners();
    }
    if (quantity == 0) {
      removeFromCart();
    }
  }

  void toggleBookmark() {
    this.bookmark = this.bookmark ? false : true;
    this.bookmark ? bookmarks.add(this) : bookmarks.remove(this);
    notifyListeners();
  }

  void addToCart() {
    this.inCart = true;
    if (quantity == 0) addQuantity();
    cart.add(this);
    notifyListeners();
  }

  void removeFromCart() {
    this.inCart = false;
    quantity = 0;
    cart.remove(this);
    notifyListeners();
  }
}
//
// class ProductNotifier extends ChangeNotifier {
//   final List<ProductModel> _products = [];
//   final List<ProductModel> _bookmarkedProducts = [];
//
//   List<ProductModel> get cart => _products;
//
//   List<ProductModel> get bookmarkedProducts => _bookmarkedProducts;
//
//   void addProduct(ProductModel product) {
//     _products.add(product);
//     notifyListeners();
//   }
//
//   void toggleBookmark(int index) {
//     if (_bookmarkedProducts.contains(index)) {
//       _bookmarkedProducts.remove(index);
//     } else {
//       _bookmarkedProducts.add(index);
//     }
//     notifyListeners();
//   }
// }

List<ProductModel> productList = [
  ProductModel(
    name: "Minimal Lamp",
    price: 30.00,
    imagePath: "assets/images/minimal_lamp.png",
    description:
        "Illuminate your space with the Minimal Lamp, a stylish lighting solution that blends seamlessly with modern decor. Its adjustable design allows you to direct light where you need it most, perfect for reading or working. The sleek, minimalistic appearance ensures it complements any room without overpowering your existing style.",
    rating: 4.8,
    reviews: 110,
  ),
  ProductModel(
    name: "Coffee Chair",
    price: 89.99,
    imagePath: "assets/images/coffee_chair.png",
    description:
        "Experience ultimate comfort with this coffee chair, designed to enhance your relaxation time. The ergonomic design provides excellent back support, while the plush cushioning ensures a cozy seating experience. Ideal for your morning coffee or a leisurely read.",
    rating: 4.7,
    reviews: 80,
  ),
  ProductModel(
    name: "Minimal Stand",
    price: 45.00,
    imagePath: "assets/images/minimal_stand.png",
    description:
        "The Minimal Stand is a versatile and sleek accessory that fits seamlessly into any modern home. Its sturdy construction supports a variety of items, from books to gadgets, helping you keep your space organized. A perfect blend of form and function, this stand adds a touch of minimalistic elegance to your decor.",
    rating: 4.3,
    reviews: 60,
  ),
  ProductModel(
    name: "Minimal Desk",
    price: 150.00,
    imagePath: "assets/images/minimal_desk.png",
    description:
        "Elevate your workspace with the Minimal Desk, designed to boost productivity while maintaining a clean aesthetic. Its spacious surface provides ample room for your work essentials, while the minimalist design reduces clutter. Crafted from premium materials, this desk is both durable and stylish.",
    rating: 4.6,
    reviews: 95,
  ),
  ProductModel(
    name: "Coffee Table",
    price: 120.99,
    imagePath: "assets/images/coffee_table.png",
    description:
        "This modern coffee table is crafted from high-quality oak wood, offering a blend of durability and style. Its sleek design complements any living room decor, making it a perfect centerpiece for social gatherings. Enjoy your coffee in style with this elegant and functional piece.",
    rating: 4.5,
    reviews: 120,
  ),
];
List<ProductModel> cart = [];
List<ProductModel> bookmarks = [];

class ProductNotifierProvider extends InheritedNotifier<ProductModel> {
  final ProductModel notifier;

  const ProductNotifierProvider({
    Key? key,
    required this.notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static ProductModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProductNotifierProvider>()!
        .notifier;
  }

  @override
  bool updateShouldNotify(covariant ProductNotifierProvider oldWidget) {
    return notifier != oldWidget.notifier;
  }
}
