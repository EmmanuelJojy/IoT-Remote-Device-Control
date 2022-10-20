import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/data/shared.dart';

Status status = const Status(led1: 0);

Future<Status> fetchStatus(int id, String state) async {
  final response =
      await http.get(Uri.parse('https://${SharedData.ip}/LED/${id}/${state}'));
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

class Status {
  final int led1;

  const Status({
    required this.led1,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      led1: json['LED1'],
    );
  }
}

void switchled(int id, int state) async {
  status = await fetchStatus(id, state == 1 ? "ON" : "OFF");
}
