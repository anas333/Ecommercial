import 'package:ecommercial/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

void main() {
  const email = Email.dirty('test@moc.com');
  const password = Password.dirty('123@wer');
  const confermPassword =
      ConfirmedPassword.dirty(password: '123@wer', value: '123@wer');
  group('Sign up state', () {
    test('support value comparsions', () {
      expect(const SignUpState(), const SignUpState());
    });
    test('support value comparsions when nothing happen', () {
      expect(const SignUpState().copyWith(), const SignUpState());
    });
    test('returns object with updated status when status is passed', () {
      expect(
        const SignUpState().copyWith(status: FormzStatus.pure),
        const SignUpState(),
      );
    });
    test('returns object with updated status when email is passed', () {
      expect(
        const SignUpState().copyWith(email: email),
        const SignUpState(email: email),
      );
    });
    test('returns object with updated password when password is passed', () {
      expect(
        const SignUpState().copyWith(password: password),
        const SignUpState(password: password),
      );
    });
    test('returns object with updated password when password is passed', () {
      expect(
        const SignUpState().copyWith(confirmedPassword: confermPassword),
        const SignUpState(confirmedPassword: confermPassword),
      );
    });
  });
}
