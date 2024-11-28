import 'package:go_router/go_router.dart';
import 'package:chat_application/core/router/constentRouter.dart';
import 'package:chat_application/features/home/ui/homePage.dart';
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Constentrouter.homepath,
   
    routes: [
     
      GoRoute(
        path: Constentrouter.homepath,
        builder: (context, state) => const MyHomePage(),
      ),
     
    ],
  );
}