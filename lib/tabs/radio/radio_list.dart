import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';

class RadioList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.sizeOf(context);

    return Container(
      height: screensize.height * 0.20,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage("assets/images/hadeth_footer.png"),

          fit: BoxFit.fill,
        ),
      ),

      child: Column(
        children: [
          Text(
            "Radio Ibrahim Al-Akdar",
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppTheme.black),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow, size: 30, color: AppTheme.black),
              SizedBox(width: 7),
              Icon(Icons.volume_up, size: 30, color: AppTheme.black),
            ],
          ),
        ],
      ),
    );
  }
}
