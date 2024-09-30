import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String trailerUrl;
  final String videoTitle;

  const VideoPlayerScreen({
    required this.videoTitle,
    required this.trailerUrl,
    Key? key,
  }) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool _isAdPlaying = true;

  @override
  void initState() {
    super.initState();
    // Print the video URL when the screen is initialized
    printVideoUrl();
  }

  // Method to print the video URL
  void printVideoUrl() {
    print('Video URL: ${widget.trailerUrl}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoTitle),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: HtmlWidget(
                    '''
                    <iframe width="100%" height="100%" src="${widget.trailerUrl}" frameborder="0" allowfullscreen></iframe>
                    ''',
                    onTapUrl: (url) {
                      // Handle if it's an ad
                      if (isAdUrl(url)) {
                        print('Ad URL: $url');
                        return false; // Prevent navigation to ad
                      }
                      return true; // Allow navigation otherwise
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_isAdPlaying)
            Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isAdPlaying = false; // Skip ad by hiding button
                  });
                  print("Ad skipped");
                },
                child: Text("Skip Ad"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.black.withOpacity(0.7), // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Method to check if the URL is an ad-related URL
  bool isAdUrl(String url) {
    // Implement your logic to detect if the URL is an ad
    return url.contains('ads') || url.contains('tracking');
  }
}
