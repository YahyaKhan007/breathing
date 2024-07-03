part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final PageController pageController;
  final int currentPage;
  OnboardingState({PageController? pageController, this.currentPage = 0})
      : pageController = pageController ?? PageController();

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
        pageController: pageController,
        currentPage: currentPage ?? this.currentPage);
  }

  @override
  List<Object> get props => [currentPage, pageController];
}
