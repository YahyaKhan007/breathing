import 'package:bloc/bloc.dart';
import 'package:breathing_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService;
  AuthenticationBloc(this.authService) : super(const AuthenticationState()) {
    on<EmailSignupEvent>(_emailSignup);
  }

  void _emailSignup(
      EmailSignupEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(emailLoading: true));

    final result = await authService.signupUserWithEmailPassword(
        userEmail: event.email.trim(), userPassword: event.password.trim());

    if (result.isSuccess == true) {
      Get.offAllNamed(RouterHelper.homeScreen);
      emit(state.copyWith(emailLoading: false));
    }
    emit(state.copyWith(emailLoading: false));
  }
}
