import 'dart:convert';
import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:oauth2/oauth2.dart';
import 'package:oauth2/src/authorization_exception.dart'
   show AuthorizationException;

class OAuth2 {
  final Uri tokenEndpoint = Uri.parse(
      "http://keycloak-ingress-l7-http.keycloak.192.168.1.203.xip.io/auth/realms/demo/protocol/openid-connect/token");
  final String userinfoEndpoint =
      "http://keycloak-ingress-l7-http.keycloak.192.168.1.203.xip.io/auth/realms/demo/protocol/openid-connect/userinfo";
  static const String identifier = "flutter_dev";
  static const String secret = "";
  bool isInvailduser;
  
  File credentialsFile = new File("credentials.json");
  final Utf8Decoder utf8decode = Utf8Decoder();
  oauth2.Client client = null;

  OAuth2();
  void deviceCredentialsFile(String dirPath) {
    this.credentialsFile = new File('$dirPath/credentials.json');
  }
  Future<bool> iscredentialsFile() async {
    return await credentialsFile.exists();
  }
  
  Future<oauth2.Client> getClient(
      {String username, String password, bool fromLocal = false}) async {
    var exists = await credentialsFile.exists();
    // If the OAuth2 credentials have already been saved from a previous run, we
    // just want to reload them.
    try {
      // refresh client
      this.client = null; 
      if (exists && fromLocal) {
        var credentials = new oauth2.Credentials.fromJson(
            await credentialsFile.readAsString());
        var client = new oauth2.Client(credentials,
            identifier: identifier, secret: secret);
        return client;
      }
      if (username.isNotEmpty && password.isNotEmpty) {
        var client = await oauth2.resourceOwnerPasswordGrant(
            tokenEndpoint, username, password,
            secret: secret,
            scopes: ["email", "profile"],
            identifier: identifier,
            basicAuth: true);
        this.client = client;
        this.isInvailduser = false;
        credentialsFile.writeAsString(client.credentials.toJson());
      }
      return client;
    } on AuthorizationException catch (e) {
      if (e.description.contains("Invalid user")) {
        this.isInvailduser = true;
      }
    }
    
  }

  Future<String> getUserinfo(oauth2.Client client) async {
    if (client.credentials.isExpired) {
      // "Token Expired"
      throw UserAccountErrorException("Token Expired");
      
    }
    final userinfoResult = await client.readBytes(userinfoEndpoint);
    final String userinfo = utf8decode.convert(userinfoResult);
    return userinfo;
  }
}
class UserAccountErrorException implements Exception {
  final String msg;
  const UserAccountErrorException(this.msg);
  String toString() => '$msg';
}