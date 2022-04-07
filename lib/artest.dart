import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';
import 'backdrop.dart';
import 'model/product.dart';
import 'category_menu_page.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ARTest extends StatefulWidget {
  @override
  _ARTestState createState() => _ARTestState();
}

class _ARTestState extends State<ARTest> {
  late UnityWidgetController _unityWidgetController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
            margin: const EdgeInsets.all(8),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                UnityWidget(
                  onUnityCreated: _onUnityCreated,
                  onUnityMessage: onUnityMessage,
                  onUnitySceneLoaded: onUnitySceneLoaded,
                ),
              ],
            )),
      ),
    );
  }

  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(scene) {
    print('Received scene loaded from unity: ${scene.name}');
    print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
  }

  void _onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}
