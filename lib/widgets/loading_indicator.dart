import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, required Color color});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppTheme.primary));
  }
}
