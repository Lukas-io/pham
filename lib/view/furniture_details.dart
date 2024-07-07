import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetails({super.key, required this.productModel});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.55,
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50.0)),
                        child: Image(
                          height: MediaQuery.sizeOf(context).height * 0.55,
                          width: MediaQuery.sizeOf(context).width * 0.87,
                          image:
                              Image.network(widget.productModel.imageUrl).image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 52.0,
                      left: 32.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0XFF8A959E).withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 40,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: IconButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    CupertinoColors.white),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)))),
                            padding: const EdgeInsets.all(12.0),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(CupertinoIcons.back)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.productModel.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Gelasio",
                            fontSize: 28.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.productModel.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 32.0),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => setState(() {
                                        // widget.productModel.addQuantity();
                                      }),
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                          const Color(0XFFF3F3F3)),
                                      shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)))),
                                  icon: const Icon(CupertinoIcons.add)),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  "${widget.productModel.quantity}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24.0),
                                ),
                              ),
                              IconButton(
                                  onPressed: () => setState(() {
                                        // widget.productModel.minusQuantity();
                                      }),
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                          const Color(0XFFF3F3F3)),
                                      shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)))),
                                  icon: const Icon(CupertinoIcons.minus)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Color(0XFFF2C94C),
                            size: 28,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "${widget.productModel.rating}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20.0),
                            ),
                          ),
                          Text(
                            "(${widget.productModel.reviews} reviews)",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16.0),
                          )
                        ],
                      ),
                      Text(
                        '${widget.productModel.description}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color(0XFFF0F0F0)),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)))),
                              padding: const EdgeInsets.all(16.0),
                              onPressed: () {
                                setState(() {
                                  // widget.productModel.toggleBookmark();
                                });
                              },
                              icon: const Icon(
                                // widget.productModel
                                //     ? CupertinoIcons.bookmark_fill
                                CupertinoIcons.bookmark,
                                size: 30.0,
                              )),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                              child: TextButton(
                            onPressed: () {
                              // if (!widget.productModel.inCart) {
                              //   setState(() {
                              //     // widget.productModel.addToCart();
                              //   });
                              // }
                            },
                            style: ButtonStyle(
                                alignment: Alignment.center,
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                padding: WidgetStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 16.0)),
                                backgroundColor: WidgetStateProperty.all(
                                    // !widget.productModel.inCart
                                    //     ? Color(0XFF242424)
                                    Color(0XFF27AE60))),
                            child: const Text(
                                // widget.productModel.inCart
                                //     ? "Added to cart"
                                "Add to cart",
                                style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0)),
                          ))
                        ],
                      )
                    ]),
              ),
            )
          ]),
    );
  }
}

//
// class RoundedRImage extends CustomClipper<RRect>{
//
//
// }
