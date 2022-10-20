import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/data/shared.dart';

Future<Status> fetchStatus(int id, String state) async {
  // print('http://${SharedData.ip}/LED/$id/$state');
  final response =
      await http.get(Uri.parse('http://${SharedData.ip}/LED/$id/$state'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Status.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Status');
  }
}

Future<void> refresh(int id, int state) async {
  SharedData.status = await fetchStatus(id, state == 1 ? "ON" : "OFF");
}
