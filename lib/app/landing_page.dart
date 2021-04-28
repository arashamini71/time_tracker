import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_project/app/home_page.dart';
import 'package:time_tracker_project/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_project/services/auth.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: true);
    return StreamBuilder<AuthUser>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            AuthUser user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return HomePage();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
