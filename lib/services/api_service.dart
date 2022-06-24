import 'dart:convert';

import 'package:http/http.dart' as http;

const String url = 'https://app.fakejson.com/q/hn7Y12Cy?token=EEdMSBObGxQlW9KVpL_f4w';

Future fetch() async {
  final response = await http.get(
    Uri.parse(url),
  );
  final responseJson = jsonDecode(response.body);

  return responseJson;
}