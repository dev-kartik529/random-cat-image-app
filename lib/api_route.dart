// ignore_for_file: avoid_print

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<List<dynamic>?> getdata() async {
  var url = Uri.https('api.thecatapi.com', '/v1/images/search');

  var response = await http.get(url);
  if (response.statusCode == 200) {
    return convert.jsonDecode(response.body);
  } else {
    return null;
  }
}
