import 'package:go_router/go_router.dart';

import '../../../features/calculate/presentation/pages/calculate_page.dart';

class CRouter {
  static final GoRouter router = GoRouter(
    routes: [GoRoute(name: "Home", path: '/', builder: (context, state) => const CalculatorPage())],
  );
}
