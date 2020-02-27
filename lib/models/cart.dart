import 'package:flutter/cupertino.dart';
import 'package:provider_app_state_management/models/catalog.dart';

class CartModel extends ChangeNotifier {
  // Private field backing [catalog] model
  CatalogModel _catalog;

  // Internal private state of the cart. Stores id's of each item.
  final List<int> _itemIds = [];

  // Current catalog, used to construct items from numeric ids.
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id) => newCatalog.getById(id) != null),
        'The catalog $newCatalog does not have any $_itemIds in it');
    _catalog = newCatalog;

    // Notify listeners in case newCatalog provides information that are different from previous one.
    // Example: availability of an item changed.
    notifyListeners();
  }

  // List of items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Current total price of all items
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);
    // Tell [Model] that it should rebuild the widgets that depend on it.
    notifyListeners();
  }
}
