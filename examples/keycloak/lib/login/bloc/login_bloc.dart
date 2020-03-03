import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/keycloak/keycloak.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';

import 'package:oauth2_repository/oauth2_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  final OAuth2 oauth2;
  final KeycloakBloc keycloakBloc;
  LoginBloc(
      {@required this.userRepository,
      @required this.authenticationBloc,
      @required this.oauth2,
      @required this.keycloakBloc})
      : assert(userRepository != null),
        assert(authenticationBloc != null),
        assert(keycloakBloc != null);
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      final client = await oauth2.getClient(
          username: event.username, password: event.password);
      try {
        if (client == null || oauth2.isInvailduser) {
          yield LoginFailure(
              error: "Fail username or password error, statuscode:401");
          return;
        }
        final userinfo = await oauth2.getUserinfo(client);
        print(userinfo);
        final token = Token(client.credentials.accessToken, client.credentials.refreshToken);
        final decodedData = jsonDecode(userinfo);
        final User user = User.fromJsonWithToken(decodedData,token);
        keycloakBloc.add(KeycloakUserInfo(info:user));
        authenticationBloc.add(LoggedIn(token: token.accessToken));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
