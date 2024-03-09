import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some2/features/main-screen/bloc/main_screen_bloc.dart';
import 'package:some2/features/main-screen/view/widgets/actions.dart';
import 'package:some2/features/main-screen/view/widgets/balance.dart';
import 'package:some2/features/main-screen/view/widgets/navigation_bar.dart';
import '../../../models/transaction_type.dart';
import 'widgets/categories.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mainScreenBloc = MainScreenBloc();
  final startTransactionType = TransactionType.EXPENSE;

  @override
  void initState() {
    _mainScreenBloc.add(LoadMainScreenEvent(startTransactionType));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<MainScreenBloc, MainScreenState>(
              bloc: _mainScreenBloc,
              builder: (BuildContext context, MainScreenState state) {
                if (state is MainScreenLoaded) {
                  return Balance(state.balance);
                }
                else if (state is MainScreenInitial) {
                  return Balance(state.balance);
                }
                else if(state is MainScreenLoadingFailure){
                   print(state.exception.toString());
                }

                return Balance(0.0);
              },
            ),
            const Divider(),
            ActionsButtons(_mainScreenBloc),
            BlocBuilder<MainScreenBloc, MainScreenState>(
              bloc: _mainScreenBloc,
              builder: (BuildContext context, MainScreenState state) {
                if (state is MainScreenLoaded || state is MainScreenInitial) {
                  return Categories(state.categories);
                }
                return const Categories([]);
              },
            ),

          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          AutoRouter.of(context).pushNamed("/transactions");
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
