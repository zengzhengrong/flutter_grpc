part of 'keycloak_bloc.dart';

abstract class KeycloakState extends Equatable {
  const KeycloakState();
  @override
  List<Object> get props => [];
}

class KeycloakInitial extends KeycloakState {}

class KeycloakLoading extends KeycloakState {}


class KeycloakInfoState extends KeycloakState {
  final User info;
  const KeycloakInfoState({this.info});
  @override
  List<Object> get props => [info];
}


class KeycloakPublicState extends KeycloakState {
  final String messgae;
  const KeycloakPublicState({this.messgae});
  @override
  List<Object> get props => [messgae];
}

class KeycloakSecuredState extends KeycloakState {
  final String messgae;
  const KeycloakSecuredState({this.messgae});
  @override
  List<Object> get props => [messgae];
}
class KeycloakPublicFailure extends KeycloakState {
  final String error;
  final int statuscode;
  const KeycloakPublicFailure({this.error,this.statuscode});
  @override
  List<Object> get props => [error];
  @override
  String toString() => "KeycloakPublicFailure:{$error}";
}

class KeycloakSecuredFailure extends KeycloakState {
  final String error;
  final int statuscode;
  const KeycloakSecuredFailure({this.error,this.statuscode});
  @override
  List<Object> get props => [error];
  @override
  String toString() => "KeycloakSecuredFailure:{$error}";
}
