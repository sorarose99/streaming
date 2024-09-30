import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/app_strings.dart';
import 'package:movies_app/core/resources/app_colors.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
    
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            label: AppStrings.movies,
            index: 0,
          ),
          _buildNavItem(
            label: AppStrings.shows,
            index: 1,
          ),
       
          _buildNavItem(
            label: AppStrings.live,
            index: 2,
          ),
         _buildNavItem(
            label: AppStrings.sports,
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String label,
    required int index,
  }) {
    final bool isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => widget.onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ?AppColors.primary: Colors.white, 
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4.0),
              height: 2.0,
              width: 30.0, 
              color:AppColors.primary,
            ),
        ],
      ),
    );
  }
}
