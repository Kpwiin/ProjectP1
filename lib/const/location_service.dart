import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getAddress(double latitude, double longitude) async {
  final apiKey = 'AIzaSyDBu9NzQ4uuyWI0BNtRsxvk04RyOoGxAVs';
  final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

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
