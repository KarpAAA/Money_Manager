import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:some2/main.dart';
import 'package:some2/models/category.dart';
import 'package:some2/models/dtos/categotyMainScreenDTO.dart';
import 'package:some2/repositories/transactions_repository.dart';

import '../models/transaction.dart';
import '../models/transaction_type.dart';

class CategoryRepository {
  Box<Category> categoriesBox;
  TransactionRepository transactionRepository = getIt<TransactionRepository>();
  CategoryRepository(this.categoriesBox);


  getAllCategories() {
    return categoriesBox.values.toList();
  }

  List<CategoryMainScreenDTO> getCategoriesWithPercentOfGeneral(TransactionType type) {
    var transactions = transactionRepository.getTransactionsByType(type);

    if(transactions.isEmpty) return [];

    var map = mapTransactionsToCategory(transactions);
    var transactionsSum = transactions.map((e) => e.sum).reduce((value, element) => value + element);

    var res = categoriesBox.values
        .where((c) => (map[c]!=null && map[c]!.isNotEmpty))
        .map((c) => CategoryMainScreenDTO(c,
        (map[c] ?? []).map((e) => e.sum).reduce((value, element) => value + element) / transactionsSum))
        .toList();

    return res;
  }

  Map<Category, List<Transaction>> mapTransactionsToCategory(List<Transaction> transactions) {
    var categories = Set.of(transactions.map((e) => e.category));

    var map = {for (var c in categories) c: <Transaction>[]};
    for (var t in transactions) {
      map[t.category]!.add(t);
    }
    return map;
  }
}
