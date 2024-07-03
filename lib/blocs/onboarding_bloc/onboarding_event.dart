part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangePageEvent extends OnboardingEvent {
  final int index;
  ChangePageEvent({required this.index});
}
