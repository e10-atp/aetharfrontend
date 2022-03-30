// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:shrine/colors.dart';
import 'package:shrine/signup.dart';
import 'package:shrine/welcome.dart';

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
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add TextFormField widgets (101)
            TextFormField(
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
            TextFormField(
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

            // TODO: Add button bar (101)
            ButtonBar(
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // TODO: Add buttons (101)
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
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
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
                    validate();
                    Navigator.pop(context);
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Add AccentColorOverride (103)
