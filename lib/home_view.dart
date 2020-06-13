import 'package:flutter/material.dart';
import 'package:flutter_web_demo/app/constants/strings.dart';
import 'package:provider/provider.dart';

import 'app/services/firebase_auth_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);
///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Home Page',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Spacer(),
            RaisedButton(
              onPressed: () {
                context.read<FirebaseAuthService>().signOut();
              },
              child: Text(Strings.signOut),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
