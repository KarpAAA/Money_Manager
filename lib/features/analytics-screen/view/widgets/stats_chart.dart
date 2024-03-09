import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../models/category.dart';
import '../../../../models/dtos/categotyMainScreenDTO.dart';
import '../../../../models/transaction_type.dart';
import '../../bloc/analytic_screen_bloc.dart';

class StatsChart extends StatefulWidget {
  final _analyticScreenBloc;
  const StatsChart(this._analyticScreenBloc, {super.key});

  @override
  State<StatsChart> createState() => _StatsChartState();
}

class _StatsChartState extends State<StatsChart> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyticScreenBloc, AnalyticScreenState>(
      bloc: widget._analyticScreenBloc,
      builder: (BuildContext context, AnalyticScreenState state) {
        if (state is AnalyticScreenLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SfCircularChart(
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<CategoryMainScreenDTO, String>(
                    dataSource: state.categories,
                    pointColorMapper:
                        (CategoryMainScreenDTO categoryDTO, _) =>
                        Color(categoryDTO.category.color),
                    xValueMapper:
                        (CategoryMainScreenDTO categoryDTO, _) =>
                    categoryDTO.category.name,
                    yValueMapper:
                        (CategoryMainScreenDTO categoryDTO, _) =>
                    categoryDTO.percent,
                    dataLabelSettings:
                    DataLabelSettings(isVisible: true),
                  )
                ],
              ),
            ],
          );
        } else if (state is AnalyticScreenEmpty) {
          return SfCircularChart(series: <CircularSeries>[
            // Render pie chart
            PieSeries<Category, String>(
              dataSource: [
                Category("CAFE", 0xFFEAFE9B,Icons.emoji_food_beverage.codePoint, TransactionType.EXPENSE),
              ],
              pointColorMapper: (Category catergory, _) => Color(0xFF8FDEAA),
              xValueMapper: (Category catergory, _) => "Empty",
              yValueMapper: (Category catergory, _) => 1,
              dataLabelSettings: DataLabelSettings(isVisible: true),
            )
          ]);
        }
        return Text('Loading');
      },
    );
  }
}
