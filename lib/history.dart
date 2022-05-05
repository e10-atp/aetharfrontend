import 'package:aethar/model/userpath.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:provider/provider.dart';
import 'userpathlist.dart';
import 'model/global.dart' as global;

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<History> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return StreamProvider<List<userpath>?>.value(
      value: DatabaseService(uid: global.uid).paths,
      initialData: null,
      child: Scaffold(
          key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Navigation menu',
            onPressed: () => Navigator.pop(context, false),
          ),
          title: const Text('user page requests'),
        ),
        // body is the majority of the screen.
        body: const UserpathList(),
      ),
    );
  }
}
