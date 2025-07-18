import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quran/quran_service.dart';
import 'package:islamiapp/tabs/quran/sura.dart' show Sura;
import 'package:islamiapp/tabs/quran/sura_detalis_screen.dart';
import 'package:islamiapp/tabs/quran/sura_item.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidith = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'sura list',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              Sura sura = QuranService.suras[index];
              return InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(SuraDetailsScreen.routeName, arguments: sura);
                },
                child: SuraItem(sura),
              );
            },
            itemCount: QuranService.suras.length,
            separatorBuilder: (_, __) => Divider(
              thickness: 1,
              color: AppTheme.white,
              indent: screenWidith * 0.1,
              endIndent: screenWidith * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
