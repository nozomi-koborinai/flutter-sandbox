import 'package:flutter/material.dart';

class CommandHistoryColumn extends StatelessWidget {
  final List<String> commandList;

  const CommandHistoryColumn({
    super.key,
    required this.commandList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Command history:',
          ),
          if (commandList.isEmpty) const Text('Command history is empty.'),
          for (var i = 0; i < commandList.length; i++)
            Text('${i + 1}. ${commandList[i]}'),
        ],
      ),
    );
  }
}
