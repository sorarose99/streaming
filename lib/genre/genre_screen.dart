
// // Function to convert list of genres to a single string
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';



// class GenreMediaScreen extends StatelessWidget {
//   final int genreId;
//   final int tmdbId;
//   final String genreName;

//   const GenreMediaScreen({
//     Key? key,
//     required this.genreId,
//     required this.tmdbId,
//     required this.genreName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<GenreMediaBloc>()..add(GetGenreMediaEvent(genreId)),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(genreName),
//         ),
//         body: BlocBuilder<GenreMediaBloc, GenreMediaState>(
//           builder: (context, state) {
//             if (state is GenreMediaLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is GenreMediaLoaded) {
//               return ListView.builder(
//                 itemCount: state.mediaList.length,
//                 itemBuilder: (context, index) {
//                   final media = state.mediaList[index];
//                   return ListTile(
//                     title: Text(media.title),
//                     // Add more details as needed
//                   );
//                 },
//               );
//             } else {
//               return const Center(child: Text('Failed to load media'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }