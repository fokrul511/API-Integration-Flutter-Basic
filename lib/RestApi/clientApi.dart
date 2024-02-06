import 'package:http/http.dart' as http;

Future<void> getProduct()async{
  Uri url = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
  http.Response response = await http.get(url);
  print(response.body);
  print(response.statusCode);

}