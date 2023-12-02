// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

import 'package:http/http.dart' as http;

Future<String> getAccessToken(
  String clientId,
  String redirectUri,
  List<String> scopes,
) async {
  // Generate the authUrl
  final authUrl = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
    'client_id': clientId,
    'redirect_uri': redirectUri,
    'scope': scopes.join(' '),
    'response_type': 'code',
  });

  // Launch the authUrl
  if (!await canLaunchUrl(authUrl)) {
    throw 'Could not launch URL: $authUrl';
  }
  await launchUrl(authUrl);

  // Retrieve authorization code
  final redirectUrl = await getRedirectUrl();
  final code = Uri.parse(redirectUrl).queryParameters['code'];

  // Exchange authorization code for access token
  final response = await http.post(
    Uri.parse('https://oauth2.googleapis.com/token'),
    body: {
      'grant_type': 'authorization_code',
      'code': code,
      'client_id': clientId,
      'client_secret': '<YOUR_CLIENT_SECRET>',
      'redirect_uri': redirectUri,
    },
  );

  final accessToken = jsonDecode(response.body)['access_token'];

  return accessToken;
}

Future<String> getRedirectUrl() async {
  // Replace this line with the actual implementation of retrieving the redirect URL
  const redirectUrl = '<YOUR_REDIRECT_URI>';
  return redirectUrl;
}
