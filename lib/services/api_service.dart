import 'dart:convert';

import 'package:http/http.dart' as http;

const String url = 'https://app.fakejson.com/q/PofsMxp0?token=o0HIpMgrq-B150WyCdY2-A';

Future fetch() async {
  final response = await http.get(
    Uri.parse(url),
  );
  final responseJson = jsonDecode(response.body);

  return responseJson;
}