import 'package:flutter/material.dart';
import 'package:flutter_sandbox/components/visiblity_elevated_button.dart';
import 'package:flutter_sandbox/samples/command_design_pattern/client_invoker/command_example_page.dart';
import 'package:flutter_sandbox/samples/google_map/google_maps_flutter_page.dart';
import 'package:flutter_sandbox/samples/scratcher/scratcher_page.dart';
import 'package:flutter_sandbox/samples/stack/stack_sample.dart';
import 'package:gap/gap.dart';

import 'observer_design_pattern/view/observer_example_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Sand Box',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            VisibilityElevatedButton(
              title: 'stack_sample',
              onPressed: () => _onPressed(context, const StackSample()),
            ),
            const Gap(7),
            VisibilityElevatedButton(
              title: 'scratcher',
              visible: false,
              onPressed: () => _onPressed(context, const ScratcherPage()),
            ),
            const Gap(7),
            VisibilityElevatedButton(
              title: 'google_maps_flutter',
              visible: false,
              onPressed: () => _onPressed(context, GoogleMapsFlutterPage()),
            ),
            const Gap(7),
            VisibilityElevatedButton(
              title: 'command_design_pattern',
              onPressed: () => _onPressed(context, const CommandExamplePage()),
            ),
            const Gap(7),
            VisibilityElevatedButton(
              title: 'observer_design_pattern',
              visible: false,
              onPressed: () => _onPressed(context, const ObserverExamplePage()),
            ),
            const Gap(7),
          ],
        ),
      ),
    );
  }
}

Future<void> _onPressed(BuildContext context, Widget widget) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
