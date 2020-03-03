import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/keycloak/keycloak_model.dart';
import 'package:api_repository/api_repository.dart';

part 'keycloak_event.dart';
part 'keycloak_state.dart';

class KeycloakBloc extends Bloc<KeycloakEvent, KeycloakState> {
  String token;
  Client client;

  @override
  KeycloakState get initialState => KeycloakInitial();

  @override
  Stream<KeycloakState> mapEventToState(
    KeycloakEvent event,
  ) async* {
    if (event is KeycloakUserInfo) {
      yield KeycloakLoading();
      client = Client(event.info.token.accessToken);
      yield KeycloakInfoState(info: event.info);
    }
    if (event is KeycloakPublicButtonPressed) {
      yield KeycloakLoading();
      final response = await client.getPublic();
      yield KeycloakPublicState(
          messgae: response.statuscode != 200
              ? response.statuscode.toString()
              : response.message);
      if (response.statuscode == 403) {
        print("KeycloakBloc: ${response.message}");
        yield KeycloakSecuredFailure(
            error: "You don't have permission", statuscode: 403);
        yield KeycloakInitial();
      }

      if (response.statuscode == 401) {
        print("KeycloakBloc: ${response.message}");
        await client.channel.shutdown();
        yield KeycloakPublicFailure(error: "Token expired", statuscode: 401);
        yield KeycloakInitial();
      }
    }
    if (event is KeycloakSecuredButtonPressed) {
      yield KeycloakLoading();
      final response = await client.getSecured();
      yield KeycloakSecuredState(
          messgae: response.statuscode != 200
              ? response.statuscode.toString()
              : response.message);
      if (response.statuscode == 403) {
        print("KeycloakBloc: ${response.message}");
        yield KeycloakSecuredFailure(
            error: "You don't have permission", statuscode: 403);
        yield KeycloakInitial();
      }
      if (response.statuscode == 401) {
        print("KeycloakBloc: ${response.message}");
        yield KeycloakSecuredFailure(error: "Token expired", statuscode: 401);
        await client.channel.shutdown();
        yield KeycloakInitial();
      }
    }
  }
}
