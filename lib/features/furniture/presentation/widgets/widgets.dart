import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pham/features/furniture/presentation/pages/product_details.dart';
import 'package:pham/features/furniture/domain/entity/product_entity.dart';

class TabIcon extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool selected;

  const TabIcon(
      {super.key,
      required this.iconData,
      required this.title,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    Color containerColor = selected ? Color(0XFF303030) : Color(0XFFF5F5F5);
    Color textColor = selected ? Color(0XFF242424) : Color(0XFF999999);

    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), color: containerColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            iconData,
            color: selected ? CupertinoColors.white : textColor,
            size: 30.0,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(
              color: textColor,
              fontWeight: selected ? FontWeight.w500 : FontWeight.normal),
        ),
      ),
    ]);
  }
}

class FurnitureProduct extends StatelessWidget {
  final ProductEntity productModel;

  // final Function<void> onClick;

  const FurnitureProduct({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) =>
                        FurnitureDetails(productModel: productModel)),
              );
            },
            child: Container(
              height: 230.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: Image.asset(productModel.imageUrl).image,
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

class CartItem extends StatefulWidget {
  final ProductEntity productModel;

  const CartItem({super.key, required this.productModel});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
                height: 110.0,
                width: 110.0,
                image: Image.asset(widget.productModel.imageUrl).image,
                fit: BoxFit.fill),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productModel.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
              ),
              Text(
                '\$ ${widget.productModel.price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => setState(() {
                            widget.productModel.addQuantity();
                          }),
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0XFFF3F3F3)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                      icon: const Icon(
                        CupertinoIcons.add,
                        size: 18.0,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "${widget.productModel.quantity}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                  ),
                  IconButton(
                      onPressed: () => setState(() {
                            widget.productModel.minusQuantity();
                          }),
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0XFFF3F3F3)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                      icon: const Icon(
                        CupertinoIcons.minus,
                        size: 18.0,
                      )),
                ],
              ),
            ],
          ),
          Expanded(
              child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                    icon: Icon(CupertinoIcons.xmark_circle),
                    onPressed: () => setState(() {
                      widget.productModel.removeFromCart();
                    }),
                  ))),
        ],
      ),
    );
  }
}

class BookmarkItem extends StatefulWidget {
  final ProductEntity productModel;

  const BookmarkItem({super.key, required this.productModel});

  @override
  State<BookmarkItem> createState() => _BookmarkItemState();
}

class _BookmarkItemState extends State<BookmarkItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image(
                height: 110.0,
                width: 110.0,
                image: Image.asset(widget.productModel.imageUrl).image,
                fit: BoxFit.fill),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productModel.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
              ),
              Text(
                '\$ ${widget.productModel.price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ],
          ),
          Expanded(
              child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(CupertinoIcons.xmark_circle),
                        onPressed: () => setState(() {
                          widget.productModel.removeFromCart();
                        }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0XFFE0E0E0),
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 30.0,
                        width: 30.0,
                        child: Icon(
                          CupertinoIcons.bag_fill,
                          size: 20.0,
                          color: Color(0XFF303030),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}