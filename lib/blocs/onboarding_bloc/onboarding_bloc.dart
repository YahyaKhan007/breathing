import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<ChangePageEvent>(_changePage);
  }

  // * Change Page Event
  void _changePage(ChangePageEvent event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentPage: event.index));
    if (state.pageController.hasClients) {
      state.pageController.animateToPage(event.index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}
