import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/withdrwal.dart';

class WithdrwalItem extends StatelessWidget {
  final Withdrwal withdItem;
  WithdrwalItem(this.withdItem);

  @override
  Widget build(BuildContext context) {
    final withdData = Provider.of<Withdrwals>(context);
    return Dismissible(
      onDismissed: (direction) => withdData.removeWithdrwals(withdItem.id),
      key: const Key(''),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.all(5),
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'are you sure to delete ?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              content: Text(
                'the item will be permanently deleted !',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('NO')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('YES'))
              ],
            );
          },
        );
      },
      child: Card(
        margin: const EdgeInsets.all(5),
        color: Theme.of(context).colorScheme.onSecondary,
        child: ListTile(
          leading: FittedBox(
            child: CircleAvatar(
              child: FittedBox(
                child: Text('\$${withdItem.amount}'),
              ),
            ),
          ),
          title: Text(withdItem.title),
          subtitle: Text(
            withdItem.reason,
            style: const TextStyle(color: Color.fromARGB(255, 205, 231, 255)),
          ),
          trailing: Text(
            DateFormat.yMMMMd().format(withdItem.dateTime),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
