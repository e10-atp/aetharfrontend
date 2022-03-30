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
import 'package:flutter/services.dart' show rootBundle;

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String text = '';

  getData() async {
    String response;
    response = await rootBundle.loadString('assets/text/about.txt');

    setState(() => text = response);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    child: const Text('back'),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(6.0),
                      shape: MaterialStateProperty.all(
                        const BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0))),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Transform.scale(
                  scale: 0.5,
                  child: Image.asset('assets/cube.png'),
                ),
                //const SizedBox(height: 16.0),
                Text(
                  'æthar',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  text,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset('assets/demo.jpg'),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('back'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(6.0),
                shape: MaterialStateProperty.all(
                  const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Add AccentColorOverride (103)
