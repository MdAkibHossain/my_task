import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDataProvider with ChangeNotifier {
  var getData;
  List<String> imageurl = [];

  Future<void> getDataProvider() async {
    final url = Uri.parse('http://194.195.244.141/DemoDataFlutterTest');

    final response = await http.get(url);

    var responsebody = jsonDecode(response.body);
    print(responsebody);
    List data = jsonDecode(response.body);
    data.forEach((element) {
      Map obj = element;
      String imageUrl = obj['imageUrl'];
      imageurl.add(imageUrl);
      print(imageUrl);
    });
    print(imageurl);

    notifyListeners();
  }
}
