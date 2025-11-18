// ignore_for_file: avoid_print

import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>?> getdata() async {
  var url = Uri.https('api.thecatapi.com', '/v1/images/search', {
    "has_breeds": "1",
    "limit": "1",
    "mime_types": "jpg,png,gif",
  });

  var response = await http.get(
    url,
    headers: {"x-api-key": dotenv.env['API_KEY']!},
  );

  if (response.statusCode == 200) {
    return convert.jsonDecode(response.body);
  } else {
    print("Error: ${response.statusCode}");
    return null;
  }
}
