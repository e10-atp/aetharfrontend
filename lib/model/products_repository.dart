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

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product> [
      Product(
        category: Category.friends,
        id: 0,
        isFeatured: true,
        name: 'Hoyoung Jung',
      ),
      Product(
        category: Category.friends,
        id: 1,
        isFeatured: true,
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
        isFeatured: true,
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
        isFeatured: false,
        name: 'Garden',
      ),
      Product(
        category: Category.rooms,
        id: 6,
        isFeatured: false,
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
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
