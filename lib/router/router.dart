import 'package:auto_route/auto_route.dart';
import '../features/analytics-screen/view/analytic_screen.dart';
import '../features/main-screen/view/main_screen.dart';
import '../features/transactions-screen/view/transactions_screen.dart';

part 'generated/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, path: '/'),
    AutoRoute(page: TransactionRoute.page, path: '/transactions'),
    AutoRoute(page: AnalyticRoute.page, path: '/analytics'),
  ];

}