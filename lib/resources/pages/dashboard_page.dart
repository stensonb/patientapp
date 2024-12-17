import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/login_page.dart';
import 'package:flutter_app/resources/pages/take_picture_page.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DashboardPage extends NyStatefulWidget {

  static RouteView path = ("/dashboard", (_) => DashboardPage());
  
  DashboardPage() : super(child: () => _DashboardPageState());
}

class _DashboardPageState extends NyPage<DashboardPage> {

  @override
  get init => () {

  };

  @override
  Widget view(BuildContext context) {
    Map userData = Auth.data();
    String username = userData["name"];
    String email = userData["email"];

    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Logo(
                    // TODO: expand this without overflow
                    height: 80,
                    width: 80,
                  ),
                  Text(username),
                  Text(email),
                ],
              ),
            ),
            /*
            UserAccountsDrawerHeader(
              accountName: Text(username),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(username),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("abc"),
                )
              ],
            ),
            */
            /*
            ListTile(
              title: new Text("All Inboxes"),
              leading: new Icon(Icons.mail),
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("Primary"),
              leading: new Icon(Icons.inbox),
            ),
            ListTile(
              title: new Text("Social"),
              leading: new Icon(Icons.people),
            ),
            */
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: new Text("Logout"),
              leading: new Icon(Icons.logout),
              onTap: _logout,
            )
          ]
        )
      )),
      appBar: AppBar(
        title: Text("Ideal Healing AI"),
        centerTitle: true,
      ),
      body: SafeArea(
         child: Center(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome $username"),
              Text("Menu here"),
              ElevatedButton(
                onPressed: () {
                    routeTo(TakePicturePage.path,
                      navigationType: NavigationType.push,
                      pageTransitionType: PageTransitionType.fade
                    );
                },
                child: const Text("Take pic..."),
              ),
//              Padding(padding: EdgeInsets.all(40)),
            ],
          ),
         ),
      ),
    );
  }
}

_logout() async {
  await Auth.logout();
  routeTo(LoginPage.path,
    pageTransitionType: PageTransitionType.fade,
    navigationType: NavigationType.pushAndForgetAll
  );
}