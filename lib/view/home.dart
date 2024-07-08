import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/controller.dart';
import '../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductController controller = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ProductModel>>(
        future: controller.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black54,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available'));
          } else {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    leading: Icon(
                      CupertinoIcons.search,
                      size: 28.0,
                    ),
                    title: Column(
                      children: [
                        Text(
                          "Make Home",
                          style: TextStyle(
                            color: Color(0XFF999999),
                            fontFamily: "Gelasio",
                          ),
                        ),
                        Text(
                          "BEAUTIFUL",
                          style: TextStyle(
                              fontFamily: "Gelasio",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ),
                      ],
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          CupertinoIcons.shopping_cart,
                          size: 28.0,
                        ),
                      )
                    ],
                  ),
                  SliverPadding(
                    sliver: SliverAnimatedGrid(
                        itemBuilder: (context, index, animation) {
                          return FadeTransition(
                              opacity: animation,
                              child: ProductItem(
                                  productModel: snapshot.data![index]));
                        },
                        initialItemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 295.0,
                                mainAxisSpacing: 16.0,
                                crossAxisSpacing: 20.0)),
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 60.0, top: 20.0),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel productModel;

  // final Function<void> onClick;

  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(children: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //       builder: (BuildContext context) =>
              //           ProductDetails(productModel: productModel)),
              // );
            },
            child: Container(
              height: 230.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(productModel.imageUrl),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
              bottom: 10.0,
              right: 10.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0XFF606060).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8.0)),
                height: 30.0,
                width: 30.0,
                child: const Icon(
                  CupertinoIcons.bag_fill,
                  size: 20.0,
                  color: CupertinoColors.white,
                ),
              ))
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
          child: Text(
            productModel.name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
          ),
        ),
        Text(
          '\$ ${productModel.price}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        )
      ],
    );
  }
}
