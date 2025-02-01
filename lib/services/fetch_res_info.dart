import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchRestaurantInfo() async {
  final response = await http.get(
    Uri.parse(
        'https://demo-api.devdata.top/api/RestaurantInfo/GetRestaurantInfo'),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    print(data);
    return data;
  } else {
    throw Exception('Failed to load restaurant info');
  }
}
