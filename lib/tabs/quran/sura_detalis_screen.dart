import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/tabs/quran/quran_service.dart';
import 'package:islamiapp/tabs/quran/sura.dart';
import 'package:islamiapp/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/sura_details';
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late Sura sura;
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;

    if (ayat.isEmpty) {
      loadSura();
    }
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(title: Text(sura.englishNames)),
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
                  sura.arabicNames,
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
            child: ayat.isEmpty
                ? LoadingIndicator(color: AppTheme.primary)
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (__, index) => Text(
                      ayat[index],
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    separatorBuilder: (_, __) => SizedBox(height: 12),
                    itemCount: ayat.length,
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

  Future<void> loadSura() async {
    String suraFileContent = await QuranService.loadSuraFile(sura.num);
    ayat = suraFileContent.split('\r\n');
    print(ayat);
    setState(() {});
  }
}
