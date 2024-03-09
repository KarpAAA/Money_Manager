part of 'analytic_screen_bloc.dart';

abstract class AnalyticScreenState {
}

class AnalyticScreenInitial extends AnalyticScreenState {
}

class AnalyticScreenLoaded extends AnalyticScreenState {
  List<Transaction> transactions;
  List<CategoryMainScreenDTO> categories;

  AnalyticScreenLoaded(this.transactions, this.categories);
}

class AnalyticScreenLoadingFailure extends AnalyticScreenState {
  final Object? exception;

  AnalyticScreenLoadingFailure({
    this.exception,
  });

}
class AnalyticScreenEmpty extends AnalyticScreenState {

}