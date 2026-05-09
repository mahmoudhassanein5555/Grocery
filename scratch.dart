import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.parse('https://grocery.newcinderella.online/public/api/orders');
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer 690|QaLdQa2hZhoUTMhijXQVrg9t69E0uImaD0lzkZkc804224bb',
    },
  );
  print(response.body);
}
