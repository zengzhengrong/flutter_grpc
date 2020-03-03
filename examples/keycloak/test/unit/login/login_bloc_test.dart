import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_login/keycloak/keycloak.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:user_repository/user_repository.dart';

import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/login/bloc/login_bloc.dart';
import 'package:oauth2_repository/oauth2_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthenticationBloc extends Mock implements AuthenticationBloc {}

class MockOauth2 extends Mock implements OAuth2 {}

class MockKeycloakBloc extends Mock implements KeycloakBloc {}

void main() {
  LoginBloc loginBloc;
  MockUserRepository userRepository;
  MockAuthenticationBloc authenticationBloc;
  MockOauth2 oauth2;
  MockKeycloakBloc keycloakBloc;
  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = MockAuthenticationBloc();
    loginBloc = LoginBloc(
        userRepository: userRepository,
        authenticationBloc: authenticationBloc,
        oauth2: oauth2,
        keycloakBloc: keycloakBloc);
  });

  tearDown(() {
    loginBloc?.close();
    authenticationBloc?.close();
  });

  test('throws AssertionError when userRepository is null', () {
    expect(
      () => LoginBloc(
        userRepository: null,
        oauth2: null,
        authenticationBloc: authenticationBloc,
        keycloakBloc: null,
      ),
      throwsAssertionError,
    );
  });

  test('throws AssertionError when authenticationBloc is null', () {
    expect(
      () => LoginBloc(
        userRepository: userRepository,
        authenticationBloc: null,
        oauth2: null,
        keycloakBloc: null,
      ),
      throwsAssertionError,
    );
  });

  test('initial state is correct', () {
    expect(LoginInitial(), loginBloc.initialState);
  });

  test('close does not emit new states', () {
    expectLater(
      loginBloc,
      emitsInOrder([LoginInitial(), emitsDone]),
    );
    loginBloc.close();
  });

  group('LoginButtonPressed', () {
    blocTest(
      'emits [LoginInitial, LoginLoading, LoginInitial] and token on success',
      build: () {
        when(userRepository.authenticate(
          username: 'valid.username',
          password: 'valid.password',
        )).thenAnswer((_) => Future.value('token'));
        return loginBloc;
      },
      act: (bloc) => bloc.add(
        LoginButtonPressed(
          username: 'valid.username',
          password: 'valid.password',
        ),
      ),
      expect: [
        LoginInitial(),
        LoginLoading(),
        LoginInitial(),
      ],
      verify: () async {
        verify(authenticationBloc.add(LoggedIn(token: 'token'))).called(1);
      },
    );

    blocTest(
      'emits [LoginInitial, LoginLoading, LoginFailure] on failure',
      build: () {
        when(userRepository.authenticate(
          username: 'valid.username',
          password: 'valid.password',
        )).thenThrow(Exception('login-error'));
        return loginBloc;
      },
      act: (bloc) => bloc.add(
        LoginButtonPressed(
          username: 'valid.username',
          password: 'valid.password',
        ),
      ),
      expect: [
        LoginInitial(),
        LoginLoading(),
        LoginFailure(error: 'Exception: login-error'),
      ],
      verify: () async {
        verifyNever(authenticationBloc.add(any));
      },
    );
  });
}
