import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  double balance;
  Balance(this.balance, {super.key});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 25, top: 15, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.balance}\$', style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge),
              Text('Total balance', style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall)
            ],
          ),
        )
      ],
    );
  }
}

