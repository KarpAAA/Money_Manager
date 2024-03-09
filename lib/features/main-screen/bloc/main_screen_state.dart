part of 'main_screen_bloc.dart';

abstract class MainScreenState {
  final double balance;
  final List<CategoryMainScreenDTO> categories;

  MainScreenState({double? balance, List<CategoryMainScreenDTO>? categories})
      : balance = balance ?? 0,
        categories = categories ?? [];
}

class MainScreenInitial extends MainScreenState {}

class MainScreenLoaded extends MainScreenState {
  MainScreenLoaded({required balance, required categories}):
        super(balance: balance, categories: categories);

}

class MainScreenLoadingFailure extends MainScreenState {
  MainScreenLoadingFailure({
    this.exception,
  });

  final Object? exception;
}
