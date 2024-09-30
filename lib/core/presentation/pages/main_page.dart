import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/presentation/components/custom_nav.dart';
import 'package:movies_app/core/presentation/pages/liveScreen.dart';
import 'package:movies_app/core/resources/app_colors.dart';
import 'package:movies_app/core/resources/app_router.dart';
import 'package:movies_app/core/resources/app_strings.dart';
import 'package:movies_app/core/resources/app_routes.dart';
import 'package:movies_app/core/resources/app_values.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  bool _isKeyboardVisible = false;
  bool _isFullScreenMode = false;
  int _currentIndex = 0; // Track the selected index

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bool isKeyboardVisible =
        WidgetsBinding.instance.window.viewInsets.bottom > 0;
    setState(() {
      _isKeyboardVisible = isKeyboardVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Hamburger Menu Icon
            IconButton(
              icon: Icon(Icons.menu),
              color: AppColors.primary,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            const SizedBox(width: 8),
            // Search Bar
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  // filled: true,
                  // fillColor: Colors.white,
                  // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  prefixIcon: Icon(Icons.search),
                ),
                onSubmitted: (query) {
                  // Navigate to search route with query
                  context.goNamed(AppRoutes.searchRoute, extra: query);
                },
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          final String location = GoRouterState.of(context).uri.toString();
          if (!location.startsWith(moviesPath)) {
            _onItemTapped(0);
          }
          return true;
        },
        child: Column(
          children: [
            // Custom Navigation Bar (at the top or any desired position)
            CustomNavBar(
              currentIndex: _currentIndex,
              onItemTapped: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _onItemTapped(index);
              },
            ),
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.moviesRoute);
        break;
      case 1:
        context.goNamed(AppRoutes.tvShowsRoute);
        break;

      case 2:
        context.goNamed(AppRoutes.liveRoute);
        break;
    
      case 3:
        context.goNamed(AppRoutes.sportRoute);
        break;
    }
  }

  void _handleFullScreenToggle(bool isFullScreen) {
    setState(() {
      _isFullScreenMode = isFullScreen;
    });
  }
}
