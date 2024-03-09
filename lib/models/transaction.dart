import 'package:hive/hive.dart';
import 'package:some2/models/category.dart';
import 'package:some2/models/transaction_type.dart';


part 'generated/transaction.g.dart';

@HiveType(typeId: 1)
class Transaction{
  @HiveField(0)
  TransactionType type;

  @HiveField(1)
  double sum;

  @HiveField(2)
  Category category;

  @HiveField(3)
  int timestamp;
  Transaction(this.type, this.sum, this.category, this.timestamp);
}
