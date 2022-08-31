import 'package:auth_repo/auth_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:database_repo/database_repo.dart';

import 'package:ecommercial/app/app.dart';
import 'package:ecommercial/app/bloc/database_bloc/database_bloc.dart';
import 'package:ecommercial/nav_pages/nav.dart';
import 'package:ecommercial/nav_pages/view/nav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class MockCloud extends Mock implements CloudFirestore {}

class MockDatabaseBloc extends MockBloc<DatabaseEvent, DatabaseState>
    implements DatabaseBloc {}

class MockUser extends Mock implements User {}

void main() {
  group('Nav pages ', () {
    test('has a page', () {
      expect(NavPages.page(), isA<MaterialPage<void>>());
    });

    late AppBloc appBloc;
    late User user;
    late DatabaseBloc databaseBloc;
    setUp(() {
      appBloc = MockAppBloc();
      user = MockUser();
      databaseBloc = MockDatabaseBloc();
      when(() => user.email).thenReturn('test@gmail.com');
      when(() => appBloc.state).thenReturn(AppState.authenticated(user));
      when(() => databaseBloc.state).thenReturn(const DatabaseInitial());
    });
    testWidgets('renders a LoginForm', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => NavigationCubit(),
                ),
                BlocProvider.value(
                  value: databaseBloc,
                ),
              ],
              child: const NavView(),
            ),
          ),
        ),
      );
      expect(find.byType(NavView), findsOneWidget);
    });
  });
}
