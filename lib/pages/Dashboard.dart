import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@Icons.import_contacts
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required User user}) : _user = user, super(key: key);
  final User _user;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(child:  Text("naber" + widget._user.email.toString()), color: Colors.white);
  }
}
