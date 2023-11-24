import 'package:driver_ambulance/feactures/mapa/presentation/pages/login/login.dart';
import 'package:go_router/go_router.dart';

import '../../mapa/presentation/pages/home/home_page.dart';
import '../../mapa/presentation/pages/login/login_screen.dart';
import '../../mapa/presentation/pages/mapa/mapa_page.dart';
import '../../mapa/presentation/pages/solicitud/solicitud_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/mapa',
      name: MapaPage.routeName,
      builder: (context, state) => const MapaPage(),
    ),
    GoRoute(
      path: '/home',
      name: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login_page',
      name: LogIn.routeName,
      builder: (context, state) => LogIn(),
    )
  ],
);
