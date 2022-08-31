import 'package:auth_repo/auth_repo.dart';
import 'package:ecommercial/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('sign up page', () {
    test(
      'has a page',
      () {
        expect(SignUpPage.route(), isA<MaterialPageRoute<void>>());
      },
    );
    testWidgets('renders a LoginForm', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider<AuthenticationRepository>(
          create: (_) => MockAuthenticationRepository(),
          child: const MaterialApp(home: SignUpPage()),
        ),
      );
      expect(find.byType(SignUpForm), findsOneWidget);
    });
  });
}
