import 'package:flutter/material.dart';

class CatalogModel {
  static const _itemNames = [
    'Code'
        'harm',
    'march',
    'savvy',
    'envy',
    'shatter',
    'violate',
    'cast',
    'taste',
    'test',
    'cleave',
    'discuss',
    'boast',
    'last',
    'satisfy',
    'refer'
  ];

  // Get item by [id], in this example, the catalog is infinite, looping over [_itemNames]
  Item getById(int id) => Item(id, _itemNames[id % _itemNames.length]);

  // Get item by its position in the catalog
  Item getByPosition(int position) {
    // using index position as id
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
