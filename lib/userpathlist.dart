import 'package:aethar/model/userpath.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserpathList extends StatefulWidget {
  const UserpathList({Key? key}) : super(key: key);

  @override
  State<UserpathList> createState() => _UserpathListState();
}

class _UserpathListState extends State<UserpathList> {
  @override
  Widget build(BuildContext context) {
    final userpaths = Provider.of<List<userpath>?>(context);
    if (userpaths != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: ListView.builder(
            itemCount: userpaths.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Card(
                  margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: ListTile(
                    title: Text(userpaths[index].page),
                    subtitle: Text(userpaths[index].time),
                  ),
                ),
              );
            }),
      );
    } else {
      return ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: ListTile(
                  title: Text(''),
                  subtitle: Text(''),
                ),
              ),
            );
          });
    }
  }
}
