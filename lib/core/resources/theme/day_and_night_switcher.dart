
// import 'package:flutter/material.dart';
// import 'package:movies_app/core/resources/theme/theme_provider.dart';

// class DayNightSwitcher extends StatefulWidget {
//   const DayNightSwitcher({super.key});

//   @override
//   _DayNightSwitcherState createState() => _DayNightSwitcherState();
// }

// class _DayNightSwitcherState extends State<DayNightSwitcher>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.bounceOut,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var themeProvider = Provider.of<ThemeProvider>(context);
//     return GestureDetector(
//       onTap: () {
//         themeProvider.toggleTheme(!themeProvider.isDarkMode());
//         if (_controller.status == AnimationStatus.completed ||
//             _controller.status == AnimationStatus.forward) {
//           _controller.reverse();
//         } else {
//           _controller.forward();
//         }
//       },
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Container(
//             width: 100,
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25),
//               color: Colors.transparent,
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                   left: themeProvider.isDarkMode() ? 0 : 50,
//                   top: 0,
//                   bottom: 0,
//                   child: AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 300),
//                     child: themeProvider.isDarkMode()
//                         ? Icon(Icons.nightlight_round,
//                             color: Colors.blue, key: UniqueKey())
//                         : Icon(Icons.wb_sunny,
//                             color: Colors.orange, key: UniqueKey()),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }