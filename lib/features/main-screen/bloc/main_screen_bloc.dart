import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some2/models/dtos/categotyMainScreenDTO.dart';
import 'package:some2/repositories/categories_repository.dart';
import 'package:some2/repositories/transactions_repository.dart';
import '../../../main.dart';
import '../../../models/transaction_type.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {

  final transactionRepository =  getIt<TransactionRepository>();

  MainScreenBloc() : super(MainScreenInitial()) {
    on<LoadMainScreenEvent>(_load);
  }

  Future<void> _load(
    LoadMainScreenEvent event,
    Emitter<MainScreenState> emit,
  ) async {
    try {
      List<CategoryMainScreenDTO> categories = getIt<CategoryRepository>()
          .getCategoriesWithPercentOfGeneral(event.type);

      emit(MainScreenLoaded(balance: transactionRepository.getBalance(), categories: categories));
    } catch (e, st) {
      emit(MainScreenLoadingFailure(exception: e));
    }
  }
}
