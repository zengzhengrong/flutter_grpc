import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/keycloak/keycloak.dart';
import 'package:flutter_login/login/login_form.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/login/bloc/login_bloc.dart';

import 'package:oauth2_repository/oauth2_repository.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;
  final OAuth2 oauth2;
  LoginPage({Key key, @required this.userRepository,@required this.oauth2})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            keycloakBloc:BlocProvider.of<KeycloakBloc>(context),
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
            oauth2: oauth2
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
