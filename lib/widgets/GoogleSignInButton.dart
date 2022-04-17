import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyingcat/Services/authentication.dart';
import 'package:flyingcat/pages/Dashboard.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: _isSigningIn ? 
            const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
            : 
            OutlinedButton(
                style : ButtonStyle(
                  backgroundColor:  MaterialStateProperty.all(Colors.white),
                  shape:  MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                    )
                  )
                ),
                onPressed: () async {

                  User? user = await Authentication.signInWithGoogle(context: context);

                  if(user != null){
                    setState(() {
                      _isSigningIn = true;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context)=> Dashboard(user: user))
                    );
                  }
                  else{
                    _isSigningIn  = false;
                  }
                }, child: Padding(
                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment:  MainAxisAlignment.center,
                   children: const <Widget>[
                     Image(
                         image: AssetImage("assets/google_logo.png"),
                         height: 35.0,
                     ),
                     Padding(padding: EdgeInsets.only(left: 10.0),
                     child: Text('Sign in with Google',
                     style: TextStyle(fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.w600),
                     ),
                     )
                   ],
                 )
            ),
            )
    );
  }
}
