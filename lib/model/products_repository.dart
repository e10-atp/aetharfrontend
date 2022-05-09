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

import 'product.dart';
import 'global.dart' as global;
import '../database.dart';

class ProductsRepository {
  static List<String> friendslist = [""];
  static updateFriends() async{
    friendslist = await DatabaseService(uid: global.uid).friendListFromSnapshot();
  }
  static List<Product> loadProducts(Category category){
    final List<String> friends;
    List<Product> allProducts;
    allProducts = <Product> [
      Product(
        category: Category.friends,
        id: 0,
        isFeatured: false,
        name: 'Hoyoung Jung',
      ),
      Product(
        category: Category.friends,
        id: 1,
        isFeatured: false,
        name: 'Casey Pan',
      ),
      Product(
        category: Category.friends,
        id: 2,
        isFeatured: false,
        name: 'Ethan Chang',
      ),
      Product(
        category: Category.friends,
        id: 3,
        isFeatured: false,
        name: 'Jeanne Li',
      ),
      Product(
        category: Category.friends,
        id: 4,
        isFeatured: false,
        name: 'Richard Pan',
      ),
      Product(
        category: Category.rooms,
        id: 5,
        isFeatured: true,
        name: 'Garden',
      ),
      Product(
        category: Category.rooms,
        id: 6,
        isFeatured: true,
        name: 'Court',
      ),
      Product(
        category: Category.rooms,
        id: 7,
        isFeatured: true,
        name: 'Bar',
      ),
      Product(
        category: Category.market,
        id: 8,
        isFeatured: true,
        name: 'Tree',
      ),
      Product(
        category: Category.market,
        id: 9,
        isFeatured: true,
        name: 'Basketball',
      ),
    ];

    for (final element in allProducts){
      if (friendslist.contains(element.name)){
        print("true");
        element.isFeatured = true;
        print(element.isFeatured);
      }
    }

    if (category == Category.all) {
      return allProducts.where((Product p) {
        return p.isFeatured == true;
      }).toList();
    } else {
      return allProducts.where((Product p) {
        return p.category == category && p.isFeatured == true; //(catetgory, bool)
      }).toList();
    }
  }
}
