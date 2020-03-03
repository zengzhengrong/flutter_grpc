import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/keycloak/keycloak.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Keycloak(),
    );
  }
}

class Display extends StatefulWidget {
  Display({Key key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  Widget selectText(state) {
    if (state is KeycloakPublicState) {
      return Text("${state.messgae}");
    }
    if (state is KeycloakSecuredState) {
      return Text("${state.messgae}");
    }
    return state is KeycloakInfoState
        ? Text("I'm ${state.info.preferredUsername}")
        : Text("");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KeycloakBloc, KeycloakState>(
      builder: (context, state) => Center(
        heightFactor: 10,
        child: Container(
          child: selectText(state),
        ),
      ),
    );
  }
}

class Keycloak extends StatelessWidget {
  const Keycloak({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<KeycloakBloc, KeycloakState>(
      listener: (context, state) async {
        if (state is KeycloakSecuredFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
          if (state.statuscode == 401) {
            await Future.delayed(Duration(seconds: 1));
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          }
        }
        if (state is KeycloakPublicFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
          if (state.statuscode == 401) {
            await Future.delayed(Duration(seconds: 1));
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          }
        }
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Display(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Center(
                        child: RaisedButton(
                      child: Text('logout'),
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LoggedOut());
                      },
                    )),
                  ),
                  Expanded(
                    child: Center(
                        child: RaisedButton(
                      child: Text('public'),
                      onPressed: () {
                        BlocProvider.of<KeycloakBloc>(context)
                            .add(KeycloakPublicButtonPressed());
                      },
                    )),
                  ),
                  Expanded(
                    child: Center(
                        child: RaisedButton(
                      child: Text('secured'),
                      onPressed: () {
                        BlocProvider.of<KeycloakBloc>(context)
                            .add(KeycloakSecuredButtonPressed());
                      },
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
