import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getProduct() async {
  Uri url = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
  var postHeader = {'Content-Type': 'application/json'};
  http.Response response = await http.get(url, headers: postHeader);
  var responsCode = response.statusCode;
  var responsBody = jsonDecode(response.body);

  if (responsCode == 200 && responsBody['status'] == 'success') {
    return responsBody["data"];
  } else {
    return [];
  }
}
