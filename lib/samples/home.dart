import 'package:flutter/material.dart';
import 'package:flutter_sandbox/samples/command_design_pattern/command_design_pattern_page.dart';
import 'package:flutter_sandbox/samples/scratcher/scratcher_page.dart';
import 'package:flutter_sandbox/samples/spotify_api/spotify_api_sample_page.dart';
import 'package:flutter_sandbox/samples/stack/stack_sample.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sand Box'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('stack_sample'),
              onPressed: () => _onPressed(context, const StackSample()),
            ),
            ElevatedButton(
              child: const Text('scratcher'),
              onPressed: () => _onPressed(context, const ScratcherPage()),
            ),
            ElevatedButton(
              child: const Text('spotify_api_sample'),
              onPressed: () =>
                  _onPressed(context, const SpotifyApiSamplePage()),
            ),
            ElevatedButton(
              child: const Text('command_design_pattern'),
              onPressed: () =>
                  _onPressed(context, const CommandDesignPatternPage()),
            ),
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
