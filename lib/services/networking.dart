import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<Map> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      return data;
    }
    else {
      throw Exception(response.statusCode);
    }
  }
}
