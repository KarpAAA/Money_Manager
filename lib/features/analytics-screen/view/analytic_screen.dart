import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:some2/extentions/all/date_extention.dart';
import 'package:some2/extentions/all/string_extention.dart';
import 'package:some2/features/analytics-screen/bloc/analytic_screen_bloc.dart';
import 'package:some2/features/analytics-screen/view/widgets/actions.dart';
import 'package:some2/features/analytics-screen/view/widgets/stats_chart.dart';
import 'package:some2/features/analytics-screen/view/widgets/transactions.dart';
import 'package:some2/features/main-screen/view/widgets/navigation_bar.dart';
import 'package:some2/models/dtos/categotyMainScreenDTO.dart';
import 'package:some2/models/transaction_type.dart';

@RoutePage()
class AnalyticScreen extends StatefulWidget {
  const AnalyticScreen({super.key});

  @override
  State<AnalyticScreen> createState() => _AnalyticScreenState();
}

class _AnalyticScreenState extends State<AnalyticScreen> {
  final _analyticScreenBloc = AnalyticScreenBloc();
  bool _ifActiveButtonExpense = true;

  @override
  void initState() {
    _analyticScreenBloc.add(LoadAnalyticScreenEvent());
    super.initState();
  }

  buttonPressed(TransactionType type) {
    _analyticScreenBloc.add(LoadAnalyticScreenEvent(transactionType: type));
    setState(() {
      _ifActiveButtonExpense = type == TransactionType.EXPENSE;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text('Analytic'),
        ),
        body: Column(
          children: [
            StatsChart(_analyticScreenBloc),
            ActionButtons(buttonPressed, _ifActiveButtonExpense),
            SizedBox(height: 20),
            Transactions(_analyticScreenBloc, _ifActiveButtonExpense)
          ],
        ),
        bottomNavigationBar: NavBar());
  }
}

