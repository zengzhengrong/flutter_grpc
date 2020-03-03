import 'dart:async';
import 'dart:convert';

import 'package:flutter_login/keycloak/keycloak.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:oauth2_repository/oauth2_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final OAuth2 oauth2;
  final KeycloakBloc keycloakBloc;
  bool hasToken;
  AuthenticationBloc(
      {@required this.userRepository,
      @required this.oauth2,
      this.keycloakBloc})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool isExist = await oauth2.iscredentialsFile();
      if (!isExist) {
        yield AuthenticationUnauthenticated();
        return;
      }
      final client = await oauth2.getClient(fromLocal: true);
      if (client.credentials.isExpired) {
        yield AuthenticationUnauthenticated();
        return;
      }
      try {
        final userinfo = await oauth2.getUserinfo(client);
        final decodedData = jsonDecode(userinfo);
        final token = Token(client.credentials.accessToken, client.credentials.refreshToken);
        final User user = User.fromJsonWithToken(decodedData,token);
        keycloakBloc.add(KeycloakUserInfo(info: user));
        hasToken = true;
      } catch (e) {
        yield AuthenticationUnauthenticated();
        return;
      }
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      try {
        yield AuthenticationLoading();
        final isFileDelete = await oauth2.credentialsFile.delete();
        print("LoggedOut Event:$isFileDelete");
        if (await oauth2.credentialsFile.exists() == false) {
          yield AuthenticationUnauthenticated();
        }
      } catch (e) {
        yield AuthenticationUnauthenticated();
      }
    }
  }
}
