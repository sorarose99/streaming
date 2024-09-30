// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:movies_app/tv_shows/data/models/IPTVChannel.dart';
// import 'package:video_player/video_player.dart';

// class IPTVChannelsScreen extends StatefulWidget {
//   @override
//   _IPTVChannelsScreenState createState() => _IPTVChannelsScreenState();
// }

// class _IPTVChannelsScreenState extends State<IPTVChannelsScreen> {
//   List<IPTVChannel> channels = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchChannels();
//   }

//   Future<void> fetchChannels() async {
//     final response = await http
//         .get(Uri.parse('https://iptv-org.github.io/api/channels.json'));

//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = jsonDecode(response.body);
//       List<IPTVChannel> fetchedChannels = [];

//       // Filtering and mapping the data to include only channels with URL
//       for (var jsonChannel in jsonList) {
//         // Fetching the M3U8 link for the channel
//         final m3u8Response = await http.get(Uri.parse(
//             'https://iptv-org.github.io/iptv/${jsonChannel['id']}.m3u8'));

//         if (m3u8Response.statusCode == 200) {
//           fetchedChannels.add(IPTVChannel(
//             id: jsonChannel['id'],
//             name: jsonChannel['name'],
//             url: m3u8Response.body.trim(), // Ensure you fetch the correct URL
//           ));
//         }
//       }

//       setState(() {
//         channels = fetchedChannels;
//         isLoading = false;
//       });
//     } else {
//       throw Exception('Failed to load channels');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('IPTV Channels'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: channels.length,
//               itemBuilder: (context, index) {
//                 final channel = channels[index];
//                 return ListTile(
//                   title: Text(channel.name),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             VideoPlayerScreen(url: channel.url),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }

// class VideoPlayerScreen extends StatefulWidget {
//   final String url;

//   VideoPlayerScreen({required this.url});

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.url)
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Stream'),
//       ),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
