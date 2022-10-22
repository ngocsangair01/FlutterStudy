import 'dart:convert';

import 'package:call_api_huan/models/subject.dart';
import 'package:http/http.dart' as http;

Future<List<Item>> getSubject() async {
  final url = "http://20.196.66.22:7000/class/api/v1/subjects/";
  final response = await http.get(Uri.parse(url));
  final responseData = json.decode(response.body);

  try {
    if (response.statusCode == 200) {
      final apiSubject = ApiSubject.fromJson(jsonDecode(response.body));
      return apiSubject.data.items;


    } else {
      return [];
    }
  } catch (exception) {
    print(responseData);
    print(exception);
    return [];
  }
}
