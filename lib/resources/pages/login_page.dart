import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/resources/pages/dashboard_page.dart';
import 'package:flutter_app/resources/pages/scan_invite_page.dart';
import 'package:flutter_app/resources/themes/styles/dark_theme_colors.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/resources/widgets/safearea_widget.dart';


class LoginPage extends NyStatefulWidget {

  static RouteView path = ("/login", (_) => LoginPage());
  
  LoginPage() : super(child: () => _LoginPageState());
}

class _LoginPageState extends NyPage<LoginPage> {

  bool isAuthenticating = false;

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ideal Healing AI"),
        centerTitle: true,
      ),
      body: SafeAreaWidget(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAuthenticating = true;
                    _login();
                  });
                },
                child: isAuthenticating? CircularProgressIndicator(color: Colors.white,) : const Text('Login (existing account)'),
              ),
              ElevatedButton(
                child: const Text("Scan Invite..."),
                onPressed: () {
                    routeTo(ScanInvitePage.path,
                      navigationType: NavigationType.push,
                      pageTransitionType: PageTransitionType.fade
                    );
                },
              ),
            ]
          )
        ),
      ),
    );
  }
}

_login() async {
  // would do OIDC flow here
  User user = User();
  user.name = "Sally Patient";
  user.email = "sally.patient@example.com";
  await Auth.authenticate(data: user);

  await sleep(1);

  routeTo(DashboardPage.path, 
    navigationType: NavigationType.pushReplace,
    pageTransitionType: PageTransitionType.fade
  );
}