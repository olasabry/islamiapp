import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';

class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isSelected ? 12.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : AppTheme.primary,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
