import 'package:go_router/go_router.dart';
import 'package:pognali/features/catalog/presentation/catalog_page.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const CatalogPage()),
  ],
);
