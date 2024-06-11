import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // root Route
  static String rootRoute = '/';

  // Auth Route
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {

    //Auth Routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none); //transition tape evita que la animacion sea como movil
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);
    
    //Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.main, transitionType: TransitionType.fadeIn);


    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
