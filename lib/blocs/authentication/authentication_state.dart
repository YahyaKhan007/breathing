part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final bool emailLoading;
  const AuthenticationState({this.emailLoading = false});

  AuthenticationState copyWith({bool? emailLoading}) {
    return AuthenticationState(
      emailLoading: emailLoading ?? this.emailLoading,
    );
  }

  @override
  List<Object> get props => [emailLoading];
}
