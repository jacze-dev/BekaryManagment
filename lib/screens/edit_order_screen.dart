import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/items.dart';
import '../providers/order_cart.dart';
import '../providers/order.dart';

class EditOrderScreen extends StatefulWidget {
  static const routeName = '/edit-order';

  @override
  State<EditOrderScreen> createState() => _EditOrderScreenState();
}

class _EditOrderScreenState extends State<EditOrderScreen> {
  var _form = GlobalKey<FormState>();
  var date = DateTime(2000);
  var ordersItemData;
  var routeEditInfo;

  //  var  initialValue = {};

  var initialValue = {
    'id': '',
    'name': '',
    'phoneNumber': 0,
    'kebd': 0,
    'keri': 0,
    'items': [],
    'amount': 0,
    'orderedDate': null,
    'delivaredDate': null,
  };

  var _editedOrder = Order(
    id: '',
    name: '',
    phoneNumber: 0,
    kebd: 0,
    keri: 0,
    items: [],
    amount: 0,
    orderedDate: DateTime.now(),
    deliveredDate: DateTime.now(),
  );
  var isNew;
  @override
  void didChangeDependencies() {
    isNew = ModalRoute.of(context)!.settings.arguments as String;
    if (!(isNew == 'false')) {
      routeEditInfo = ModalRoute.of(context)!.settings.arguments.toString();
      if (routeEditInfo != '') {
        final order = Provider.of<Orders>(context)
            .orders
            .firstWhere((order) => routeEditInfo == order.id);
        initialValue = {
          'id': order.id,
          'name': order.name,
          'phoneNumber': order.phoneNumber,
          'kebd': order.kebd,
          'keri': order.keri,
          'items': order.items,
          'amount': order.amount,
          'orderedDate': order.orderedDate,
          'delivaredDate': order.deliveredDate,
        };
        _editedOrder = Order(
            id: '',
            name: _editedOrder.name,
            phoneNumber: _editedOrder.phoneNumber,
            kebd: _editedOrder.kebd,
            amount: initialValue['amount'] as double,
            keri: initialValue['keri'] as double,
            items: initialValue['items'] as List<OrderItem>,
            orderedDate: initialValue['orderedDate'] as DateTime,
            deliveredDate: initialValue['delivaredDate'] as DateTime);
      }
    }

    super.didChangeDependencies();
  }

  void _showCalendar(BuildContext ctx) {
    showDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2040),
            context: ctx)
        .then((dateSelected) {
      setState(() {
        if (date != DateTime(2000)) {
          return;
        }
        date = dateSelected as DateTime;
      });

      _editedOrder = Order(
          id: '',
          name: _editedOrder.name,
          phoneNumber: _editedOrder.phoneNumber,
          kebd: _editedOrder.kebd,
          items: _editedOrder.items,
          orderedDate: _editedOrder.orderedDate,
          deliveredDate: date as DateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Items>(context).Itemlist;
    final ordersItemData = Provider.of<OrderItems>(context);

    void _saveOrder() {
      var isValid = _form.currentState!.validate();
      if (!isValid) {
        return;
      }
      _form.currentState?.save();

      _editedOrder = Order(
          id: '',
          name: _editedOrder.name,
          phoneNumber: _editedOrder.phoneNumber,
          kebd: _editedOrder.kebd,
          items: _editedOrder.items,
          amount: ordersItemData.totalAmount(),
          orderedDate: _editedOrder.orderedDate,
          deliveredDate: _editedOrder.deliveredDate);
      Provider.of<Orders>(context, listen: false).addOrder(_editedOrder);

      Provider.of<OrderItems>(context, listen: false).clear();
      Navigator.of(context).pop();
    }

    void _updateOrder() {
      var isValid = _form.currentState!.validate();
      if (!isValid) {
        return;
      }
      _form.currentState?.save();

      _editedOrder = Order(
          id: initialValue['id'].toString(),
          name: _editedOrder.name,
          phoneNumber: _editedOrder.phoneNumber,
          kebd: _editedOrder.kebd,
          items: _editedOrder.items,
          amount: ordersItemData.totalAmount(),
          orderedDate: _editedOrder.orderedDate,
          deliveredDate: _editedOrder.deliveredDate);
      Provider.of<Orders>(context, listen: false)
          .updateOrder(_editedOrder.id, _editedOrder);

      Provider.of<OrderItems>(context, listen: false).clear();
      Navigator.of(context).pop();
    }

    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Edit order')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: initialValue['name'].toString(),
                decoration: InputDecoration(
                  labelText: 'name:',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == '') {
                    return 'please input name';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedOrder = Order(
                      id: '',
                      name: newValue.toString(),
                      phoneNumber: _editedOrder.phoneNumber,
                      kebd: _editedOrder.kebd,
                      items: _editedOrder.items,
                      orderedDate: _editedOrder.orderedDate,
                      deliveredDate: _editedOrder.deliveredDate);
                },
              ),
              TextFormField(
                initialValue: '${initialValue['phoneNumber']}',
                decoration: InputDecoration(
                  labelText: 'Phone Numbre:',
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Please enter phone number';
                  }
                  if (!value!.startsWith('0') &&
                      !value.startsWith('251') &&
                      !value.startsWith('9')) {
                    return 'please enter the correct phone number';
                  }

                  if (value.contains(RegExp(r'[A-Z][a-z]'))) {
                    return 'phone number doesn\'t has a character';
                  }

                  if (!(value.length == 10) &&
                      !(value.length == 13) &&
                      !(value.length == 12) &&
                      !(value.length == 9)) {
                    return 'invalid phone number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  _editedOrder = Order(
                      id: '',
                      name: _editedOrder.name,
                      phoneNumber: int.parse(newValue.toString()),
                      kebd: _editedOrder.kebd,
                      items: _editedOrder.items,
                      orderedDate: _editedOrder.orderedDate,
                      deliveredDate: _editedOrder.deliveredDate);
                },
              ),
              TextFormField(
                initialValue: initialValue['kebd'].toString(),
                decoration: InputDecoration(
                  labelText: 'Kebd:',
                ),
                validator: (value) {
                  if (value == '') {
                    return 'enter kebd';
                  }
                  if (isNew == 'false') {
                    if (double.parse(value.toString()) >
                        ordersItemData.totalAmount()) {
                      return 'the kebd is grater than the total';
                    }
                    if (!(isNew == 'false')) {
                      if (double.parse(value.toString()) >
                          double.parse(initialValue['amount'].toString())) {
                        return 'the kebd is grater than the total';
                      }
                    }
                  }
                  if (double.parse(value.toString()) <
                      ordersItemData.totalAmount() * (30 / 100)) {
                    return 'the kebd is too small please pay more than \$${ordersItemData.totalAmount() * (30 / 100)}';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  _editedOrder = Order(
                      id: '',
                      name: _editedOrder.name,
                      phoneNumber: _editedOrder.phoneNumber,
                      kebd: double.parse(newValue.toString()),
                      items: _editedOrder.items,
                      orderedDate: _editedOrder.orderedDate,
                      deliveredDate: _editedOrder.deliveredDate);
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                // color: Colors.grey,
                height: 200,
                child: ListView.builder(
                  itemCount: itemData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: FittedBox(
                              child: Text('\$${(itemData[index].itemPrice)}'),
                            ),
                          ),
                          title: Text(itemData[index].title),
                          trailing: TextButton(
                            onPressed: () {
                              ordersItemData.addToCart(
                                  itemData[index].id,
                                  itemData[index].title,
                                  itemData[index].itemPrice);

                              List<OrderItem> items = isNew == false
                                  ? ordersItemData.orderedItem.values.toList()
                                  : initialValue['items'] as List<OrderItem>;
                              _editedOrder = Order(
                                  id: DateTime.now().toString(),
                                  name: _editedOrder.name,
                                  phoneNumber: _editedOrder.phoneNumber,
                                  kebd: _editedOrder.kebd,
                                  items: items,
                                  orderedDate: _editedOrder.orderedDate,
                                  deliveredDate: _editedOrder.deliveredDate);
                            },
                            child: const Text('order'),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date == DateTime(2000)
                        ? 'Enter delivary date!'
                        : DateFormat.yMMMMd().format(date),
                  ),
                  IconButton(
                    onPressed: () {
                      _showCalendar(context);
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  child: isNew == 'false' ? Text('Submit') : Text('update'),
                  onPressed: () {
                    isNew == 'false' ? _saveOrder() : _updateOrder();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
