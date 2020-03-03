part of 'keycloak_bloc.dart';

abstract class KeycloakEvent extends Equatable {
  const KeycloakEvent();

  @override
  List<Object> get props => [];
}

class KeycloakUserInfo extends KeycloakEvent {
  final User info;
  KeycloakUserInfo({this.info});

  @override
  List<Object> get props => [info];
}

class KeycloakPublicButtonPressed extends KeycloakEvent {}

class KeycloakSecuredButtonPressed extends KeycloakEvent {}
