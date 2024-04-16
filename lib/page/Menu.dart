import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monkeydosomething/const/colors.dart';
import 'package:monkeydosomething/const/shop.dart';
import 'package:monkeydosomething/page/info_shop.dart';
import 'package:monkeydosomething/utils/helper.dart';
import 'package:monkeydosomething/utils/Food.dart';
import 'package:provider/provider.dart';


import '../const/button.dart';
import '../const/food_tlie.dart';

import '../page/Food_detail_page.dart';

class Menu extends StatelessWidget {
  static const routeName = "/Menu";

 

  void NavigateToFoodDetails(BuildContext context, Food food) {

    final shop = context.read<Shop>();
    // ignore: unused_local_variable
    final foodMenu =shop.foodMenu;
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodDetailPage(food: food)),
    );
  }



  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text('Thailand'),

        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/Cartpage');
          }, 
          icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.placeholderBg,
                borderRadius: BorderRadius.circular(25)),
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Karn Pizza',
                      style: Helper.getTheme(context).headline6,
                    ),
                    SizedBox(height: 20),
                    Mybutton(text: 'information', onTap: () {
                      Navigator.of(context)
                        .pushReplacementNamed(InfoShop.routeName,);
                    }, Function: () {  },),
                  ],
                ),
                Image.asset(
                  Helper.getAssetName("pizza.png", "virtual"),
                  height: 100,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.placeholderBg),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.placeholderBg),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here..",
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
               onTap: () => NavigateToFoodDetails(context, foodMenu[index],),

              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      '/Users/apple/work/monkeydosomething/assets/images/real/dessert.jpg',
                      height: 60,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "ice cream",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '\฿120.00',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
