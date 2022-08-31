import 'package:auth_repo/auth_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:database_repo/database_repo.dart';
import 'package:ecommercial/app/app.dart';
import 'package:ecommercial/app/bloc/database_bloc/database_bloc.dart';
import 'package:ecommercial/login/login.dart';
import 'package:ecommercial/nav_pages/nav.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUser extends Mock implements User {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockDatabaseRepository extends Mock implements CloudFirestore {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class MockDatabaseBloc extends MockBloc<DatabaseEvent, DatabaseState>
    implements DatabaseBloc {}

void main() {
  group('App', () {
    late AuthenticationRepository authenticationRepository;
    late DatabaseBloc databaseBloc;
    late User user;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      databaseBloc = MockDatabaseBloc();

      user = MockUser();
      when(() => authenticationRepository.user).thenAnswer(
        (_) => const Stream.empty(),
      );
      when(() => databaseBloc.state).thenReturn(const DatabaseInitial());

      when(() => authenticationRepository.currentUser).thenReturn(user);
      when(() => user.isNotEmpty).thenReturn(true);
      when(() => user.isEmpty).thenReturn(false);
      when(() => user.email).thenReturn('test@gmail.com');
    });
  });

  group('AppView', () {
    late AuthenticationRepository authenticationRepository;
    late AppBloc appBloc;
    late CloudFirestore cloudFirestore;
    late DatabaseBloc databaseBloc;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      appBloc = MockAppBloc();
      cloudFirestore = MockDatabaseRepository();
      databaseBloc = MockDatabaseBloc();
    });

    testWidgets('navigates to LoginPage when unauthenticated', (tester) async {
      when(() => appBloc.state).thenReturn(const AppState.unauthenticated());
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: authenticationRepository,
          child: MaterialApp(
            home: BlocProvider.value(value: appBloc, child: const AppView()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('navigates to Nav when authenticated', (tester) async {
      final user = MockUser();
      when(() => user.email).thenReturn('test@gmail.com');
      when(() => appBloc.state).thenReturn(AppState.authenticated(user));
      when(() => databaseBloc.state).thenReturn(const DatabaseInitial());
      await tester.pumpWidget(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(
              value: authenticationRepository,
            ),
            RepositoryProvider.value(value: cloudFirestore)
          ],
          child: MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: appBloc,
                ),
                BlocProvider.value(
                  value: databaseBloc,
                )
              ],
              child: const AppView(),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(NavPages), findsOneWidget);
    });
  });
}
