import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/hadeth/hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadeth_details';
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(title: Text('hadith${hadeth.num}')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  hadeth.title,
                  style: textTheme.headlineSmall!.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
                Image.asset(
                  'assets/images/details_header_right.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (__, index) => Text(
                hadeth.content[index],
                style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
                textAlign: TextAlign.center,
              ),
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemCount: hadeth.content.length,
            ),
          ),
          Image.asset(
            'assets/images/details_footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
