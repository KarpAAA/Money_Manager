import 'package:hive/hive.dart';

part 'generated/transaction_type.g.dart';

@HiveType(typeId: 2)
enum TransactionType{

  @HiveField(0)
  INCOME,

  @HiveField(1)
  EXPENSE,

}