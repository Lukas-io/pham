import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pham/home.dart';
import 'package:pham/product_model.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SUCCESS!",
                style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Gelasio"),
              ),
              Image(
                image: Image.asset("assets/images/success.png").image,
                width: MediaQuery.sizeOf(context).width * 0.75,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Your order will be delivered soon. Thank you for choosing our app!",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Gelasio"),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                margin: EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () {
                    cart.clear();
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 16.0)),
                      backgroundColor:
                          WidgetStateProperty.all(Color(0XFF242424))),
                  child: Text("BACK TO HOME",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
