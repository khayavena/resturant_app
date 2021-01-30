//1
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

//3
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      home: MyHomePage(title: 'Firebase Auth Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
//5
            return FlatButton(
              child: const Text('Sign out'),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                var googleSignIn = GoogleSignIn();
                googleSignIn.signIn().then((results) {
                  print(
                      'Results :Name ${results.displayName},email:${results.email}');
                }).catchError((error) {
                  print('Signing Error $error');
                });
              },
            );
          }),

        ],
      ),
      body: Container(
        child:RaisedButton(
          onPressed: () {
            var googleSignIn = GoogleSignIn();
            googleSignIn.signIn().then((results) {
              print(
                  'Results :Name ${results.displayName},email:${results.email}');
            }).catchError((error) {
              print('Signing Error $error');
            });

          },
          child: Text("Click me"),
        ),
      ),
    );
  }

// Future signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final AccessToken result = await FacebookAuth.instance.login();
//
//   // Create a credential from the access token
//   final AuthCredential facebookAuthCredential =
//       FacebookAuthProvider.getCredential(accessToken: result.token);
//   if (facebookAuthCredential != null) {
//     print('It Worked ${facebookAuthCredential.toString()}');
//   }
//
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance
//       .signInWithCredential(facebookAuthCredential);
// }
}
