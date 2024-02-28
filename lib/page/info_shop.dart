import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:monkeydosomething/page/Menu.dart';

class InfoShop extends StatefulWidget {
  const InfoShop({Key? key}) : super(key: key);
  static const routeName = "/InfoShop";

  @override
  State<InfoShop> createState() => _InfoShopState();
}

class _InfoShopState extends State<InfoShop> {
  String _shopAddress = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchAddress(13.726495596081893,100.43871017018716).then((address) {
      setState(() {
        _shopAddress = address;
      });
    });
  }

  Future<String> fetchAddress(double latitude, double longitude) async {
    final apiKey = 'AIzaSyDBu9NzQ4uuyWI0BNtRsxvk04RyOoGxAVs';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      if (results.isNotEmpty) {
        return results[0]['formatted_address'];
      }
    }

    return 'Address not found';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shop Name: Karn pizza',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Address: $_shopAddress',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Menu.routeName);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
