import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monkeydosomething/const/button.dart';
import 'package:monkeydosomething/const/shop.dart';
import 'package:monkeydosomething/utils/Food.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class FoodDetailPage extends StatefulWidget {
  final Food? food;
  const FoodDetailPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailPage> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      shop.addToCart(widget.food!, quantityCount);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Text(
            "Successfully added to cart",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);

                //pop to previous screen
                Navigator.pop(context);
              },
              icon: Icon(Icons.done,
              color: Colors.white,),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food!.imagepath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.food!.rating,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.food!.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: AppColor.orange,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\฿" + widget.food!.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove, color: Colors.black),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.black),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Mybutton(
                  text: "Add To cart",
                  onTap: addToCart,
                  Function: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
