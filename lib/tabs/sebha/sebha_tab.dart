import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;

  double angle = 0;

  int index = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "الله أكبر",
    "لا إله إلا الله",
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Image.asset('assets/images/sebhatail.png'),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: onClick,
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset('assets/images/sebhabody.png'),
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.7,

                child: Column(
                  children: [
                    Text(
                      azkar[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${counter}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onClick() {
    counter++;
    angle += 20;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == azkar.length) {
      index = 0;
      counter = 0;
    }
    setState(() {});
  }
}
