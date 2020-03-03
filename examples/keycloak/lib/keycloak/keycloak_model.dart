class User {
  // field
  String sub;
  bool emailVerified;
  String name;
  String preferredUsername;
  String givenName;
  String familyName;
  String email;
  Token token;
  User.fromJsonWithToken(Map<String, dynamic> data,Token token) {
    sub = data["sub"];
    emailVerified = data["email_verified"];
    name = data["name"];
    preferredUsername = data["preferred_username"];
    givenName = data["given_name"];
    familyName = data["family_name"];
    email = data["email"];
    this.token = token;
  }
}

class Token {
  String accessToken;
  String refreshToken;

  Token(this.accessToken, this.refreshToken)
      : assert(accessToken != null),
        assert(accessToken != null);
}
