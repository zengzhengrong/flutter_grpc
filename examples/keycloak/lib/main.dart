import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/keycloak/keycloak.dart';
import 'package:flutter_login/login/login_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/splash/splash.dart';
import 'package:flutter_login/home/home.dart';
import 'package:flutter_login/common/common.dart';

import 'package:oauth2_repository/oauth2_repository.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

localPath() async {
  try {
    var tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    var appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    print('tempPath: ' + tempPath);
    print('appDocPath: ' + appDocPath);
    return appDocPath;
  } catch (err) {
    print(err);
    return err;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  final path = await localPath();
  final OAuth2 oauth2 = OAuth2()..deviceCredentialsFile(path);
  AuthenticationBloc authenticationBloc;
  runApp(
    BlocProvider<KeycloakBloc>(
      create: (context) => KeycloakBloc(),
      child: BlocProvider<AuthenticationBloc>(
          create: (context) {
            authenticationBloc = AuthenticationBloc(
                userRepository: userRepository,
                oauth2: oauth2,
                keycloakBloc: BlocProvider.of<KeycloakBloc>(context))
              ..add(AppStarted());
            return authenticationBloc;
          },
          child: App(userRepository: userRepository, oauth2: oauth2)),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;
  final OAuth2 oauth2;

  App({Key key, @required this.userRepository, @required this.oauth2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository, oauth2: oauth2);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );
  }
}
