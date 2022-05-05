import 'package:flutter/material.dart';
import 'package:aethar/colors.dart';
import 'package:aethar/signup.dart';
import 'package:aethar/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'model/global.dart' as global;
import 'database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw
      });
    });
  }

  void validate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 12.0),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                child: const Text(
                  'about',
                  style: TextStyle(color: aePurple300),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary,
                  ),
                  shape: MaterialStateProperty.all(
                    const BeveledRectangleBorder(
                      //side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                onPressed: () {
                  _usernameController.clear();
                  _passwordController.clear();
                  //Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const WelcomePage()),
                  );
                },
              ),
            ),

            const SizedBox(height: 60.0),
            Column(
              children: <Widget>[
                Transform.scale(
                  scale: 0.75,
                  child: Image.asset('assets/cube.png'),
                ),
                //const SizedBox(height: 16.0),
                Text(
                  'æthar',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            const SizedBox(height: 32.0),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'username',
                labelStyle: TextStyle(
                    color: _usernameFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : _unfocusedColor),
              ),
              focusNode: _usernameFocusNode,
            ),
            //spacer
            const SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                labelStyle: TextStyle(
                    color: _usernameFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : _unfocusedColor),
              ),
              focusNode: _passwordFocusNode,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: const Text('sign up'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        //side: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Clear the text fields (101)
                    _usernameController.clear();
                    _passwordController.clear();
                    //Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignupPage()),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('login'),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(6.0),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0))),
                    ),
                  ),
                  onPressed: () {
                    String email = _usernameController.text;
                    String password = _passwordController.text;
                    login(email, password);
                  },
                  // onPressed: () {
                  //   _usernameController.clear();
                  //   _passwordController.clear();
                  //   Navigator.pop(context);
                  // },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var user = userCredential.user;
      if(user != null){
        await DatabaseService(uid: user.uid).updateUserData('signed in');
        await DatabaseService(uid: user.uid).updateUserData('friends');
        global.uid = user.uid;
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
