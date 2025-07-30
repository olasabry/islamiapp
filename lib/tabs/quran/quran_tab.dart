import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quran/most_recently_section.dart';
import 'package:islamiapp/tabs/quran/quran_service.dart';
import 'package:islamiapp/tabs/quran/sura.dart' show Sura;
import 'package:islamiapp/tabs/quran/sura_detalis_screen.dart';
import 'package:islamiapp/tabs/quran/sura_item.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidith = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                'assets/images/icons/quran.svg',
                colorFilter: ColorFilter.mode(
                  AppTheme.primary,
                  BlendMode.srcIn,
                ),
                height: 28,
                width: 28,
                fit: BoxFit.scaleDown,
              ),
            ),
            onChanged: (query) {
              QuranService.searchSura(query);
              setState(() {});
            },
          ),
        ),
        MostRecentlySection(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text('sura list', style: textTheme.titleMedium),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              Sura sura = QuranService.suraSearchResults[index];
              return InkWell(
                onTap: () async {
                  QuranService.addSuraToMostRecently(sura);
                  await Navigator.of(
                    context,
                  ).pushNamed(SuraDetailsScreen.routeName, arguments: sura);
                  setState(() {});
                },
                child: SuraItem(sura),
              );
            },
            itemCount: QuranService.suraSearchResults.length,
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
