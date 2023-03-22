import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rovio/src/movement/movement.dart';
import 'package:rovio/src/version.dart';

class Rovio {
  Rovio({
    required this.host,
    required this.port,
    required this.username,
    required this.password,
    http.Client? client,
  }) {
    _client = client ?? http.Client();
    rovioUrl = 'http://$host:$port/';

    // Initialise capabilities
    movement = Movement(this);
  }

  final String host;
  final int port;
  final String username;
  final String password;

  late String rovioUrl;

  late http.Client _client;

  //late RovioAudio audio;
  //late RovioCamera camera;
  late Movement movement;

  Future<String> sendRequest(String commandUrl) async {
    final response = await _client.get(
      Uri.parse('$rovioUrl$commandUrl'),
      headers: {
        'Authorization':
            'Basic ${base64.encode(utf8.encode('$username:$password'))}',
      },
    );

    return response.body;
  }

  Future<Version> getVersion() async {
    final response = await sendRequest('GetVer.cgi');
    return Version(response);
  }
}
