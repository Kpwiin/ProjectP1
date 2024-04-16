import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:monkeydosomething/const/button.dart";
import "package:monkeydosomething/const/shop.dart";
import "package:monkeydosomething/page/payment_page.dart";
import "package:monkeydosomething/utils/Food.dart";
import "package:provider/provider.dart";

class Cartpage extends StatelessWidget {
  static const routeName = "/Cartpage";
  const Cartpage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeTocart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text("my Cart"),
          elevation: 0,
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;

                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[200],
                        ),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Mybutton(
                text: "Pay Now",
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Paymentpage())),
                Function: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
