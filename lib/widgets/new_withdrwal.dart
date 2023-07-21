import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/withdrwal.dart';

class NewWithdrwal extends StatefulWidget {
  @override
  State<NewWithdrwal> createState() => _NewWithdrwalState();
}

class _NewWithdrwalState extends State<NewWithdrwal> {
  final titleController = TextEditingController();

  final reasonController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final withdrData = Provider.of<Withdrwals>(context);
    final title = titleController.text as String;
    final reason = reasonController.text as String;
    final amount = amountController.text as String;
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Text('New Withdrwals'),
          TextField(
            decoration: InputDecoration(label: Text('Title')),
            maxLines: 1,
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(label: Text('Reason')),
            maxLines: 1,
            controller: reasonController,
          ),
          TextField(
            decoration: InputDecoration(label: Text('Amount')),
            maxLines: 1,
            keyboardType: TextInputType.number,
            controller: amountController,
          ),
          Row(
            children: [
              Spacer(),
              TextButton(
                  onPressed: () {
                    withdrData.addWithdrwal(
                        DateTime.now().toString(), title, reason, amount);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
