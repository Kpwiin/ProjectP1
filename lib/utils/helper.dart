import 'package:flutter/material.dart';

class Helper {
  static  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
    }

    static double getScreenHeight(BuildContext context) {
      return MediaQuery.of(context).size.height;
    }

    static String getAssetName(String flieName, String type) {
      return "assets/images/$type/$flieName";

    }
    static TextTheme getTheme(BuildContext context){
      return Theme.of(context).textTheme;
    }

  static void showSnackBar(BuildContext context, String s) {}
}

      
