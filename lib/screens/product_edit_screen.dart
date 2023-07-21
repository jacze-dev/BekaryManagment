import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/items.dart';

class ProductEditScreen extends StatefulWidget {
  static const routeName = 'edit_product';

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  Item _editedItem = Item(
    id: '',
    title: '',
    itemPrice: 0,
    maked: 0,
    passed: 0,
    stale: 0,
  );
  var initValue = {
    'id': '',
    'title': '',
    'itemPrice': 0,
    'maked': 0,
    'passed': 0,
    'stale': 0,
  };
  var isNew;
  @override
  void didChangeDependencies() {
    isNew = ModalRoute.of(context)!.settings.arguments.toString();
    if (!(isNew == 'new')) {
      var id = ModalRoute.of(context)!.settings.arguments.toString();
      print('not new');
      if (id != '') {
        var item = Provider.of<Items>(context).findById(id);
        initValue = {
          'id': item.id,
          'title': item.title,
          'itemPrice': item.itemPrice,
          'maked': item.maked,
          'passed': item.passed,
          'stale': item.stale,
        };
      }
    }
    super.didChangeDependencies();
  }

  var _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Items>(context);
    void _save() {
      var isValid = _form.currentState!.validate();
      if (!isValid) {
        return;
      }

      _form.currentState!.save();
      itemData.addItem(_editedItem);
      Navigator.of(context).pop();
      print(_editedItem.title);
    }

    void _update() {
      var isValid = _form.currentState!.validate();
      if (!isValid) {
        return;
      }

      _form.currentState!.save();
      itemData.updateItem(_editedItem.id, _editedItem);
      Navigator.of(context).pop();
      print(_editedItem.title);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            (isNew == 'new') ? 'New Product' : initValue['title'].toString()),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: initValue['title'].toString(),
                decoration: InputDecoration(labelText: 'title:'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'please enter the title';
                  }
                  if (value.toString().length < 2) {
                    return 'the title is too short';
                  }
                  if (value.toString().length > 15) {
                    return 'too long title';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedItem = Item(
                    id: initValue['id'].toString(),
                    title: newValue.toString(),
                    itemPrice: _editedItem.itemPrice,
                    maked: _editedItem.maked,
                    passed: _editedItem.passed,
                    stale: _editedItem.stale,
                  );
                },
              ),
              TextFormField(
                initialValue: initValue['itemPrice'].toString(),
                decoration: InputDecoration(labelText: 'price:'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (double.parse(value.toString()) <= 0) {
                    return 'invalid amount';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedItem = Item(
                    id: _editedItem.id,
                    title: _editedItem.title,
                    itemPrice: double.parse(newValue.toString()),
                    maked: _editedItem.maked,
                    passed: _editedItem.passed,
                    stale: _editedItem.stale,
                  );
                },
              ),
              TextFormField(
                initialValue: initValue['maked'].toString(),
                decoration: InputDecoration(labelText: 'quantity:'),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (int.parse(value.toString()) <= 0) {
                    return 'invalid quantity';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedItem = Item(
                    id: _editedItem.id,
                    title: _editedItem.title,
                    itemPrice: _editedItem.itemPrice,
                    maked: int.parse(newValue.toString()),
                    passed: _editedItem.passed,
                    stale: _editedItem.stale,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    (isNew == 'new') ? _save() : _update();
                  },
                  child: Text((isNew == 'new') ? 'save' : 'update')),
            ],
          ),
        ),
      ),
    );
  }
}
