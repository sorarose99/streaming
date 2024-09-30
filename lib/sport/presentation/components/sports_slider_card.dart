
// import 'package:flutter/material.dart';

// class SportsSliderCard extends StatelessWidget {
//   final String homeTeam;
//   final String awayTeam;
//   final String matchTime;
//   final String league;
//   final String homeTeamLogo; // URL of the home team logo
//   final String awayTeamLogo; // URL of the away team logo
//   final Duration timeUntilMatch;  // Countdown timer

//   const SportsSliderCard({
//     super.key,
//     required this.homeTeam,
//     required this.awayTeam,
//     required this.matchTime,
//     required this.league,
//     required this.homeTeamLogo,   // Home team logo
//     required this.awayTeamLogo,   // Away team logo
//     required this.timeUntilMatch,  // Countdown timer
//   });

//   @override
//   Widget build(BuildContext context) {
//     print('Rendering SportsSliderCard: $homeTeam vs $awayTeam');

//     return Stack(
//       children: [
//         // Background Image or Color
//         Container(
//           height: 300,
//           decoration: BoxDecoration(
//             color: Colors.grey.shade900, // Add a background color
//           ),
//         ),

//         // Home Team Logo
//         Positioned(
//           left: 20,
//           top: 80,
//           child: Image.network(
//             homeTeamLogo,
//             width: 70,
//             height: 70,
//             fit: BoxFit.cover,
//             errorBuilder: (context, error, stackTrace) {
//               return Icon(Icons.error); // Show an error icon if the image fails to load
//             },
//           ),
//         ),

//         // Away Team Logo
//         Positioned(
//           right: 20,
//           top: 80,
//           child: Image.network(
//             awayTeamLogo,
//             width: 70,
//             height: 70,
//             fit: BoxFit.cover,
//             errorBuilder: (context, error, stackTrace) {
//               return Icon(Icons.error); // Show an error icon if the image fails to load
//             },
//           ),
//         ),

//         // Match Information (Centered)
//         Positioned(
//           bottom: 20,
//           left: 20,
//           right: 20,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Match Title: Home Team vs Away Team
//               Text(
//                 '$homeTeam vs $awayTeam',
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 8),

//               // League Name
//               Text(
//                 league,
//                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                   color: Colors.white70,
//                 ),
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(height: 8),

//               // Match Time
//               Text(
//                 'Match Time: $matchTime',
//                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:movies_app/sport/domain/entities/sport.dart';
import 'package:go_router/go_router.dart';

class SportsSliderCard extends StatelessWidget {
  final Sport match;  // Use the entire Sport entity

  const SportsSliderCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        // Background Image or Color
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
          ),
        ),

        // Home Team Logo
        Positioned(
          left: 20,
          top: 80,
          child: Image.network(
            match.homeTeamLogo,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),

        // Away Team Logo
        Positioned(
          right: 20,
          top: 80,
          child: Image.network(
            match.awayTeamLogo,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),

        // Match Information (Centered)
        Positioned(
          bottom: 60,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${match.homeTeam} vs ${match.awayTeam}',
                style: textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                match.league,
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Match Time: ${match.matchTime}',
                style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        // Live Button to Navigate to Live Stream
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              context.go('/sport/${match.liveStreamUrl}'); // Navigate to live stream screen
            },
            child: const Text('Watch Live'),
          ),
        ),
      ],
    );
  }
}
