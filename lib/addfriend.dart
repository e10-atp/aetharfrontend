import 'package:aethar/model/userpath.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'model/product.dart';
import 'model/products_repository.dart' as pr;
import 'package:provider/provider.dart';
import 'userpathlist.dart';
import 'model/global.dart' as global;

class AddFriend extends StatefulWidget {
  const AddFriend({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddFriend> {
  final _usernameController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final category = Category.friends;
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
            onPressed: (){
              Navigator.pop(context, false);
              pr.ProductsRepository.loadProducts(category);
           }
          ),
          title: const Text('Add Friends'),
        ),
        // body is the majority of the screen.
        body: Center(
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                    color: _usernameFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : _unfocusedColor),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed:(){
                    String name = _usernameController.text;
                    DatabaseService(uid: global.uid).updateFriendList(name);
                  },
                ),
              ),
              focusNode: _usernameFocusNode,
            ),
        //spacer
        ),
      ),
    );
  }
}