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

import 'things.dart';

class ThingRepo {
  static List<Thing> loadThing(Category category) {
    const allThings = <Thing>[
      Thing(
        category: Category.friends,
        id: 0,
        isFeatured: true,
        name: 'Hoyoung Jung',
      ),
      Thing(
        category: Category.friends,
        id: 1,
        isFeatured: true,
        name: 'Casey Pan',
      ),
      Thing(
        category: Category.friends,
        id: 2,
        isFeatured: false,
        name: 'Ethan Chang',
      ),
      Thing(
        category: Category.friends,
        id: 3,
        isFeatured: true,
        name: 'Jeanne Li',
      ),
      Thing(
        category: Category.friends,
        id: 4,
        isFeatured: false,
        name: 'Richard Pan',
      ),
      Thing(
        category: Category.rooms,
        id: 5,
        isFeatured: false,
        name: 'Garden',
      ),
      Thing(
        category: Category.rooms,
        id: 6,
        isFeatured: false,
        name: 'Court',
      ),
      Thing(
        category: Category.rooms,
        id: 7,
        isFeatured: true,
        name: 'Bar',
      ),
      Thing(
        category: Category.market,
        id: 8,
        isFeatured: true,
        name: 'Tree',
      ),
      Thing(
        category: Category.market,
        id: 9,
        isFeatured: true,
        name: 'Basketball',
      ),
    ];
    /*if (category == Category.all) {
      return allThings;
    } else {
      return allThings.where((Thing t) {
        return t.category == category;
      }).toList();
    }*/
    return allThings.where((Thing t) {
      return t.category == category;
    }).toList();
  }
}
