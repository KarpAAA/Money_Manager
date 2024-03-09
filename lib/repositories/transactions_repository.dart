import 'package:hive/hive.dart';
import 'package:some2/models/transaction.dart';
import '../models/transaction_type.dart';

class TransactionRepository {
  Box<Transaction> transactionBox;

  TransactionRepository(this.transactionBox);

  double getBalance() {
    var transactions = transactionBox.values.toList();

    var incomeSum = transactions
        .where((t) => t.type == TransactionType.INCOME)
        .fold(0.0, (value, element) => value + element.sum);

    var expenseSum = transactions
        .where((t) => t.type == TransactionType.EXPENSE)
        .fold(0.0, (value, element) => value + element.sum);

    return incomeSum - expenseSum;
  }

  List<Transaction> getTransactions() {
    return transactionBox.values.toList();
  }


  List<Transaction> getTransactionsByType(TransactionType type) {
    List<Transaction> transactions = transactionBox.values
        .where((transaction) => transaction.type == type)
        .toList();
    return transactions;
  }

  void addTransaction(Transaction transaction) {
    transactionBox.add(transaction);
  }
}
