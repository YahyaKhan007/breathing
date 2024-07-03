part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class EmailSignupEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const EmailSignupEvent({required this.email, required this.password});
}
