import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:some2/extentions/all/date_extention.dart';
import 'package:some2/extentions/all/string_extention.dart';

import '../../bloc/analytic_screen_bloc.dart';

class Transactions extends StatefulWidget {
  final analyticScreenBloc;
  final ifActiveButtonExpense;
  const Transactions(this.analyticScreenBloc, this.ifActiveButtonExpense, {super.key});

  @override
  State<Transactions> createState() => _TransactionState();
}

class _TransactionState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticScreenBloc, AnalyticScreenState>(
      bloc: widget.analyticScreenBloc,
      builder: (BuildContext context, AnalyticScreenState state) {
        if (state is AnalyticScreenLoaded) {
          return Expanded(
              child: ListView.builder(
                  itemCount: state.transactions.length,
                  itemBuilder: (context, index) {
                    bool showDate = index == 0 ||
                        !DateTime.fromMillisecondsSinceEpoch(
                            state.transactions[index].timestamp)
                            .compareIgnoringTime(
                            DateTime.fromMillisecondsSinceEpoch(
                                state.transactions[index - 1]
                                    .timestamp));
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 6.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0),
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                Column(children: [
                                  showDate
                                      ? Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        bottom: 20.0),
                                    child: Row(children: [
                                      Text(DateFormat(
                                          'yyyy-MM-dd')
                                          .format(DateTime
                                          .fromMillisecondsSinceEpoch(
                                          state
                                              .transactions[
                                          index]
                                              .timestamp)))
                                    ]),
                                  )
                                      : Row(),
                                  Row(
                                    children: [
                                      Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration:
                                          const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                          child: Icon(
                                            IconData(
                                                state
                                                    .transactions[index]
                                                    .category
                                                    .icon,
                                                fontFamily:
                                                "MaterialIcons"),
                                            size: 20,
                                            color: Colors.white,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 14.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              state.transactions[index]
                                                  .category.name
                                                  .toLowerCase()
                                                  .capitalize(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      state.transactions[index].sum
                                          .toString()
                                          .leading(
                                          widget.ifActiveButtonExpense
                                              ? "-"
                                              : "+"),
                                      style: TextStyle(
                                          color: widget.ifActiveButtonExpense
                                              ? Colors.red
                                              : Colors.green),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    );
                  }));
        } else if (state is AnalyticScreenEmpty) {
          return const Center(child: Text("You have no transactions"));
        }
        return Text('Loading');
      },
    );
  }
}
