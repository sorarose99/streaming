import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/resources/app_router.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/resources/app_strings.dart';
import 'package:movies_app/core/resources/app_theme.dart';
import 'package:movies_app/watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MediaAdapter());
  await Hive.openBox('items');
  ServiceLocator.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    BlocProvider(
      create: (context) => sl<WatchlistBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: getApplicationTheme(),
      routerConfig: AppRouter().router,
    );
  }
}



//  import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:movies_app/core/domain/entities/media.dart';
// import 'package:movies_app/core/resources/app_router.dart';
// import 'package:movies_app/core/services/service_locator.dart';
// import 'package:movies_app/core/resources/app_strings.dart';
// import 'package:movies_app/core/resources/app_theme.dart';
// import 'package:movies_app/watchlist/presentation/controllers/watchlist_bloc/watchlist_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// void main() async {
//   FlutterError.onError = (FlutterErrorDetails details) {
//     FlutterError.dumpErrorToConsole(details);
//     // Handle error
//     if (kDebugMode) {
//       print(details.exception);
//     }
//   };

//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   Hive.registerAdapter(MediaAdapter());
//   await Hive.openBox('items');
//   ServiceLocator.init();

//   // Initialize AdMob
//   MobileAds.instance.initialize();
//   // MobileAds.instance.registerNativeAdFactory('myNativeAdFactory', MyNativeAdFactory());

//   runApp(
//     MultiProvider(
//       providers: [
//         // ChangeNotifierProvider(create: (_) => ThemeProvider()),
//       ],
//       child: BlocProvider(
//         create: (context) => sl<WatchlistBloc>(),
//         child: const MyApp(),
//       ),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // var themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: AppStrings.appTitle,
//       theme: getApplicationTheme(),
//       // themeProvider.getTheme(), 
//       routerConfig: AppRouter().router,
//       builder: (context, router) {
//         return Scaffold(
//           // appBar: AppBar(
//           //   title: const Text(''),
//           //   actions: const [
//           //     DayNightSwitcher(),
//           //   ],
//           // ),
//           body: router!,
//         );
//       },
//     );
//   }
// }


