import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:some2/features/transactions-screen/view/widgets/categories_list.dart';
import 'package:some2/features/transactions-screen/view/widgets/sum_input.dart';
import 'package:some2/main.dart';
import 'package:some2/repositories/categories_repository.dart';
import 'package:some2/repositories/transactions_repository.dart';

import '../../../models/transaction.dart';
import '../../../models/transaction_type.dart';
import '../../main-screen/view/widgets/navigation_bar.dart';
import 'widgets/switcher.dart';

@RoutePage()
class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final transactionRepository = getIt<TransactionRepository>();
  late var categories;
  bool _ifExpenseChosen = true;
  double sum = 0;
  int _selectedCategoryIndex = 0;

  void addTransaction() {
    transactionRepository.addTransaction(Transaction(
        _ifExpenseChosen ? TransactionType.EXPENSE : TransactionType.INCOME,
        sum,
        categories[_selectedCategoryIndex],
        DateTime.now().add(Duration(days: 2)).millisecondsSinceEpoch
    ));

    AutoRouter.of(context).pushNamed("/");
  }

  void changeCategories(newValue) {
    _ifExpenseChosen = newValue;
    setState(() {
      categories = getIt<CategoryRepository>().getAllCategories().where((c) => c.type ==
          (_ifExpenseChosen ? TransactionType.EXPENSE : TransactionType.INCOME)
      ).toList();
    });
  }

  void setSelectedCategoriesIndex(index){
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  void changeSum(sum){
    this.sum = sum;
  }
  @override
  Widget build(BuildContext context) {
    changeCategories(_ifExpenseChosen);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("New transaction",
                style: Theme.of(context).textTheme.bodyMedium)),
        actions: [
          IconButton(
            icon: const Icon(Icons.done, color: Colors.black),
            onPressed: () => {addTransaction()},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: SwitcherWidget(changeCategories, _ifExpenseChosen)
            ),
            SumInput(changeSum),
            const Divider(),
            CategoriesList(categories, _selectedCategoryIndex, setSelectedCategoriesIndex)
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
