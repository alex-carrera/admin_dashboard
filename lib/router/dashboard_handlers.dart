import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auh_provider.dart';

import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';

class DashboardHandlers {
  static Handler main = Handler(handlerFunc: (context, params) {

    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return DashboardView();
    else
      return LoginView();

  });
}
