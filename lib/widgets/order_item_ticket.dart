import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';
import '../screens/edit_order_screen.dart';

class OrderItemTicket extends StatefulWidget {
  Order order;
  OrderItemTicket(this.order);

  @override
  State<OrderItemTicket> createState() => _OrderItemTicketState();
}

class _OrderItemTicketState extends State<OrderItemTicket> {
  var isExpanded = false;

  void switchBool() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Dismissible(
      key: const Key('key'),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        orderData.removeOrder(widget.order.id);
      },
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.red,
        child: Icon(
          Icons.delete_forever,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        color: const Color.fromARGB(255, 162, 198, 228),
        child: Column(
          children: [
            ListTile(
              title: Text(
                widget.order.name.toString(),
              ),
              subtitle: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(widget.order.deliveredDate),
                    ),
                  ],
                ),
              ),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        switchBool();
                      },
                      icon: Icon(
                          !isExpanded ? Icons.expand_more : Icons.expand_less),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            EditOrderScreen.routeName,
                            arguments: widget.order.id);
                      },
                      icon: Icon(Icons.edit),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (isExpanded)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const Text('Ordered items'),
                    Container(
                      height: widget.order.items.length * 20.0 + 10,
                      child: ListView(
                        children: [
                          ...widget.order.items.map((item) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item.name),
                                Text('${item.quantity} X \$${item.price}'),
                                Text('\$${item.quantity * item.price}'),
                              ],
                            );
                          }).toList()
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text('\$${widget.order.amount}'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ordered date:'),
                        Text(
                          DateFormat.yMMMMd().format(widget.order.orderedDate),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('delivery date:'),
                        Text(
                          DateFormat.yMMMMd()
                              .format(widget.order.deliveredDate),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('kebd:'),
                        Text(
                          '\$${widget.order.kebd}',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('keri'),
                        Text(
                          '\$${widget.order.amount - widget.order.kebd}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
