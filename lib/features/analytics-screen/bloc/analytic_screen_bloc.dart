import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some2/models/transaction_type.dart';
import 'package:some2/repositories/categories_repository.dart';

import '../../../main.dart';
import '../../../models/dtos/categotyMainScreenDTO.dart';
import '../../../models/transaction.dart';
import '../../../repositories/transactions_repository.dart';

part 'analytic_screen_event.dart';
part 'analytic_screen_state.dart';


class AnalyticScreenBloc extends Bloc<AnalyticScreenEvent, AnalyticScreenState>{
  final transactionRepository =  getIt<TransactionRepository>();
  final categoryRepository =  getIt<CategoryRepository>();

  AnalyticScreenBloc():super(AnalyticScreenInitial()){
    on<LoadAnalyticScreenEvent>(_load);
  }

  Future<void> _load(LoadAnalyticScreenEvent event, Emitter<AnalyticScreenState> emit) async {
    TransactionType type = event.transactionType;
    try{
      var transactions = transactionRepository.getTransactionsByType(type);
      if(transactions.isEmpty){
        emit(AnalyticScreenEmpty());
        return;
      }
      emit(AnalyticScreenLoaded(
          transactions,
          categoryRepository.getCategoriesWithPercentOfGeneral(type)));
    }
    catch(e){
      emit(AnalyticScreenLoadingFailure(exception: e));
    }
  }


}