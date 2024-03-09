import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:some2/repositories/categories_repository.dart';
import 'package:some2/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'models/category.dart';
import 'models/transaction.dart';
import 'models/transaction_type.dart';
import 'repositories/transactions_repository.dart';
import 'router/router.dart';

GetIt getIt = GetIt.instance;

Future<void> main() async {

  await Hive.initFlutter();

  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
  Hive.registerAdapter(TransactionAdapter());

  var categoriesBox = await Hive.openBox<Category>('categories');
  var transactionsBox  = await Hive.openBox<Transaction>('transactions');

  // await transactionsBox.clear();
  await categoriesBox.clear();
  List<Category> categories = [
    Category("CAFE", 0xFFEAFE9B,Icons.emoji_food_beverage.codePoint, TransactionType.EXPENSE),
    Category("BILLS", 0xFFB6A8DB, Icons.balance.codePoint, TransactionType.EXPENSE),
    Category("FOOD", 0xFFCCE4C4, Icons.no_food.codePoint, TransactionType.EXPENSE),
    Category("CHARITY", 0xFFB8A17D, Icons.accessibility_new_sharp.codePoint, TransactionType.EXPENSE),
    Category("OTHER", 0xFFBDE5F2, Icons.auto_awesome.codePoint, TransactionType.EXPENSE),

    Category("WORK", 0xFFEAD9D5, Icons.account_balance_rounded.codePoint, TransactionType.INCOME),
    Category("BUSINESS", 0xFFEDDCA2, Icons.work.codePoint, TransactionType.INCOME),
    Category("OTHER", 0xFFBDE5F2, Icons.auto_awesome.codePoint, TransactionType.INCOME),
  ];

  for (var c in categories) {
    await categoriesBox.add(c);
  }

  getIt.registerSingleton(categoriesBox);
  getIt.registerSingleton<TransactionRepository>(TransactionRepository(transactionsBox));
  getIt.registerSingleton<CategoryRepository>(CategoryRepository(categoriesBox));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
