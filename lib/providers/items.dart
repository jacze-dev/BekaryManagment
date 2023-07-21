import 'package:flutter/material.dart';

class Item {
  final String id;
  final String title;
  final double itemPrice;
  final int maked;
  final int passed;
  final int stale;

  Item({
    required this.id,
    required this.title,
    required this.itemPrice,
    required this.maked,
    required this.passed,
    required this.stale,
  });
}

class Items with ChangeNotifier {
  List<Item> _itemList = [
    Item(
        id: 'it1',
        title: 'bread 6',
        itemPrice: 6.0,
        maked: 100,
        passed: 12,
        stale: 3),
    Item(
        id: 'it2',
        title: 'bread 7',
        itemPrice: 7.0,
        maked: 80,
        passed: 2,
        stale: 14),
    Item(
        id: 'it3',
        title: 'bread 8',
        itemPrice: 8.0,
        maked: 50,
        passed: 12,
        stale: 15),
    Item(
        id: 'it4',
        title: 'bread 12',
        itemPrice: 12.0,
        maked: 34,
        passed: 12,
        stale: 10),
    Item(
        id: 'it5',
        title: 'bread 35',
        itemPrice: 35.0,
        maked: 54,
        passed: 12,
        stale: 10),
    Item(
        id: 'it6',
        title: 'cookies 85',
        itemPrice: 85.0,
        maked: 21,
        passed: 12,
        stale: 10),
    Item(
        id: 'it7',
        title: 'cookies 160',
        itemPrice: 160.0,
        maked: 34,
        passed: 12,
        stale: 10),
    Item(
        id: 'it8',
        title: 'griciline',
        itemPrice: 15.0,
        maked: 60,
        passed: 12,
        stale: 10),
    Item(
        id: 'it9',
        title: 'flour 1Kg',
        itemPrice: 120.0,
        maked: 12,
        passed: 12,
        stale: 10),
  ];
  Map<String, Object> _items = {
    'items': Items,
    'sold': [0, 0, 0, 0, 0, 0, 0, 0, 0],
    'price': [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
  };

  Map<String, Object> get item {
    return {..._items};
  }

  int getSold(int index) {
    (_items['sold'] as List)[index] = (_itemList[index].maked +
        _itemList[index].passed -
        _itemList[index].stale);

    return (_items['sold'] as List)[index];
  }

  double getPrice(int index) {
    (_items['price'] as List)[index] =
        _itemList[index].itemPrice * getSold(index);

    return ((_items['price'] as List)[index] as double);
  }

  List<Item> get Itemlist {
    return [..._itemList];
  }

  void addItem(Item item) {
    _itemList.add(Item(
        id: DateTime.now().toString(),
        title: item.title,
        itemPrice: item.itemPrice,
        maked: item.maked,
        passed: item.passed,
        stale: item.stale));
    notifyListeners();
  }

  Item findById(String id) {
    return _itemList.firstWhere((element) => element.id == id);
  }

  void updateItem(String id, Item item) {
    var i = _itemList.indexOf(findById(id));
    _itemList[i] = item;
    notifyListeners();
  }

  void deleteItem(String id) {
    _itemList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
