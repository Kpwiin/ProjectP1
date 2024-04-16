import 'package:flutter/material.dart';
import 'package:monkeydosomething/utils/Food.dart';

class Shop extends ChangeNotifier {

 final List<Food> _foodMenu = [
    Food(
        name: "Hawaiian Pizza",
        price: "10.00",
        imagepath:
            "/Users/apple/work/monkeydosomething/assets/images/real/pizza2.jpg",
        rating: "4.7"),
    Food(
        name: "Margherita Pizza",
        price: "15.00",
        imagepath:
            "/Users/apple/work/monkeydosomething/assets/images/real/pizza4.jpg",
        rating: "4.9"),
  ];

  List<Food> _cart=[];


  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;


  void addToCart (Food foodItem , int quantity){
    for(int i=0; i<quantity; i++){
      _cart.add(foodItem);
  }
  notifyListeners();

}
  void removeTocart (Food food){
    _cart.remove(food);
    notifyListeners();
  }
}