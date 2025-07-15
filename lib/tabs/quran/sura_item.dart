import 'package:flutter/material.dart';
import 'package:islamiapp/tabs/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;
  SuraItem(this.sura);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          height: 52,
          width: 52,
          margin: EdgeInsets.only(right: 24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sura_number_frame.png'),
            ),
          ),
          child: Text(
            '${sura.num}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sura.englishNames, style: textTheme.titleLarge),
            Text('${sura.ayatcount} verses', style: textTheme.titleSmall),
          ],
        ),
        Spacer(),
        Text(sura.arabicNames, style: textTheme.titleLarge),
      ],
    );
  }
}
