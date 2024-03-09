part of 'analytic_screen_bloc.dart';

abstract class AnalyticScreenEvent{}

class LoadAnalyticScreenEvent extends AnalyticScreenEvent {
  final TransactionType transactionType;

  LoadAnalyticScreenEvent({TransactionType? transactionType})
      : transactionType = transactionType ?? TransactionType.EXPENSE;
}
