import 'package:flutter/material.dart';
import 'package:monkeydosomething/const/colors.dart';
import 'package:monkeydosomething/page/Menu.dart';
import '../utils/helper.dart';

class Home extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Good morning Alongkorn",
                      style: Helper.getTheme(context).headline5,
                    ),
                    Image.asset(Helper.getAssetName("cart.png", "virtual"))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text("Delivering To"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: DropdownButtonHideUnderline(
                  child: SizedBox(
                    width: 250,
                    child: DropdownButton<String>(
                      value: "Current location",
                      items: [
                        DropdownMenuItem(
                          child: Text("Current Location"),
                          value: "Current location",
                        )
                      ],
                      icon: Image.asset(
                        Helper.getAssetName("dropdown_filled.png", "virtual"),
                      ),
                      style: Helper.getTheme(context).headline4,
                      onChanged: (value) {
                        // Handle dropdown value change here
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                      shape: StadiumBorder(), color: AppColor.placeholderBg),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Image.asset(
                        Helper.getAssetName("search_filled.png", "virtual"),
                      ),
                      hintText: "Search Food",
                      hintStyle: TextStyle(
                        color: AppColor.placehodelder,
                        fontSize: 18,
                      ),
                      contentPadding: const EdgeInsets.only(
                        top: 17,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                      image: Image.asset(
                        Helper.getAssetName("hamburger2.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "USA",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryCard(
                      image: Image.asset(
                        Helper.getAssetName("rice2.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "India",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryCard(
                      image: Image.asset(
                        Helper.getAssetName("fruit.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Italian",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CategoryCard(
                      image: Image.asset(
                        Helper.getAssetName("rice.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Thailand",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Restaurants",
                        style: Helper.getTheme(context).headline5,
                      ),
                      TextButton(onPressed: () {}, child: Text("View all"))
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Menu.routeName);
                },
                child: RestaurantCard(
                  image: Image.asset(
                    Helper.getAssetName("pizza2.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                  name: "Karn pizza",
                ),
              ),
              RestaurantCard(
                image: Image.asset(
                  Helper.getAssetName("breakfast.jpg", "real"),
                  fit: BoxFit.cover,
                ),
                name: "winter cafe",
              ),
              RestaurantCard(
                image: Image.asset(
                  Helper.getAssetName("bakery.jpg", "real"),
                  fit: BoxFit.cover,
                ),
                name: "Pai bakery",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    required this.image,
    required this.name,
    Key? key,
  }) : super(key: key);
  final Image image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: image,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(name, style: Helper.getTheme(context).headline3)
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(color: AppColor.orange),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("248 rating"),
                    SizedBox(
                      width: 5,
                    ),
                    Text("cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text("Western Food"),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final Image image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 100,
              height: 100,
              child: image,
            ),
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: Helper.getTheme(context)
                .headline4
                ?.copyWith(color: AppColor.primary, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
