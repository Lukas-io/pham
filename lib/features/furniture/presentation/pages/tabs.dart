import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pham/features/furniture/domain/entity/product_entity.dart';
import 'package:pham/features/furniture/presentation/pages/success.dart';
import 'package:pham/features/furniture/presentation/widgets/widgets.dart';

Widget HomeBody(BuildContext context) {
  return CustomScrollView(
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
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.0),
          width: MediaQuery.of(context).size.width,
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              TabIcon(
                iconData: CupertinoIcons.star_fill,
                title: "Popular",
                selected: true,
              ),
              TabIcon(
                iconData: Icons.chair_alt_outlined,
                title: "Chair",
              ),
              TabIcon(
                iconData: Icons.table_bar_outlined,
                title: "Table",
              ),
              TabIcon(
                iconData: Icons.chair_outlined,
                title: "Armchair",
              ),
              TabIcon(
                iconData: CupertinoIcons.bed_double,
                title: "Bed",
              ),
              TabIcon(
                iconData: Icons.light,
                title: "Lamp",
              ),
            ],
          ),
        ),
      ),
      SliverPadding(
        sliver: SliverAnimatedGrid(
            itemBuilder: (context, index, animation) {
              return FadeTransition(
                  opacity: animation,
                  child: FurnitureProduct(productModel: productList[index]));
            },
            initialItemCount: productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 295.0,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 20.0)),
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
      ),
    ],
  );
}

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  double totalPrice() {
    double total = 0;
    for (ProductEntity product in cart) {
      total += product.price * product.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text(
            "My Cart",
            style: TextStyle(
              fontFamily: "Gelasio",
            ),
          ),
        ),
        cart.isNotEmpty
            ? SliverMainAxisGroup(slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      cart.length,
                      (index) {
                        return CartItem(productModel: cart[index]);
                      },
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total:",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.systemGrey),
                              ),
                              Text(
                                "\$ ${totalPrice()}",
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width - 20,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => SuccessScreen(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                                alignment: Alignment.center,
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                padding: WidgetStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 24.0)),
                                backgroundColor:
                                    WidgetStateProperty.all(Color(0XFF242424))),
                            child: Text("Check out",
                                style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            : const SliverFillRemaining(
                child: Center(
                    child: Text(
                  "No Items in Cart",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "Gelasio",
                      color: CupertinoColors.systemGrey),
                )),
              ),
      ],
    );
  }
}

Widget WishListBody(BuildContext context) {
  return CustomScrollView(
    slivers: [
      const SliverAppBar(
        title: Text(
          "Wishlist",
          style: TextStyle(
            fontFamily: "Gelasio",
          ),
        ),
      ),
      cart.isNotEmpty
          ? SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  bookmarks.length,
                  (index) {
                    return BookmarkItem(productModel: bookmarks[index]);
                  },
                ),
              ),
            )
          : const SliverFillRemaining(
              child: Center(
                  child: Text(
                "No Items in Your Wishlist",
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: "Gelasio",
                    color: CupertinoColors.systemGrey),
              )),
            ),
    ],
  );
  ;
}
