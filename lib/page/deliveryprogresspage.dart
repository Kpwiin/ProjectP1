import "package:flutter/material.dart";
import "package:monkeydosomething/page/Home.dart";
import "package:monkeydosomething/page/Menu.dart";
import "package:monkeydosomething/page/my_receipt.dart";

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in Process"),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildNavigationBar(context),
      body: Column(
        children: [MyReceipt()],
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {Navigator.pushNamed(context, Home.routeName);},
                icon: Icon(Icons.arrow_back),
              ),
            ),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Go Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
