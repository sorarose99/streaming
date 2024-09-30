import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Use this to launch the live stream URL

class SportLiveScreen extends StatelessWidget {
  final String liveStreamUrl;

  const SportLiveScreen({super.key, required this.liveStreamUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Stream'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (await canLaunch(liveStreamUrl)) {
              await launch(liveStreamUrl);
            } else {
              throw 'Could not launch $liveStreamUrl';
            }
          },
          child: const Text('Watch Live'),
        ),
      ),
    );
  }
}
