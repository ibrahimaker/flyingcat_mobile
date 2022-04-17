import 'package:flutter/material.dart';
import 'package:flyingcat/Services/authentication.dart';
import 'package:flyingcat/res/CustomColors.dart';

import '../widgets/GoogleSignInButton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Image.asset('assets/cat_logo.png', height: 160),
                  ),
                  const SizedBox(height: 20),
                  const Text('Flying Cat',
                      style: TextStyle(color: Colors.orange, fontSize: 40)),
                  const Text('Authentication',
                      style: TextStyle(color: Colors.indigo, fontSize: 40))
                ],
              )),
              FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Has Error Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return const GoogleSignInButton();
                    }
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(CustomColors.firebaseOrange),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
