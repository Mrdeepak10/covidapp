import 'dart:convert';

import 'package:http/http.dart' as http;

class APICalling {
  static final APICalling _singleton = APICalling._internal();

  factory APICalling() {
    return _singleton;
  }

  APICalling._internal();

  static const String _BASE_URL = 'https://api.covid19api.com';

  Future<dynamic> getDefault() async {
    var url = _BASE_URL + "/";
    // var body = {'ContactEmail': "deepak@gmail.com", 'AgreementNo': "0003"};
    print("Calling Api: $url");
    // print("params: $body");
    var response = await http.get(Uri.parse(url));
    var res = jsonDecode(response.body);
    return res;
  }
}
