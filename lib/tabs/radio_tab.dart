import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamiapp/widgets/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xb3202020),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                dividerColor: const Color.fromARGB(70, 0, 0, 0),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Color(0xFFE2BE7F),
                  borderRadius: BorderRadius.circular(12),
                ),
                unselectedLabelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(text: 'Radio'),
                  Tab(text: 'Reciters'),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(8),
              height: screenSize.height * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/details_footer.png'),
                  fit: BoxFit.fill,
                ),
                color: Color(0xFFE2BE7F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'Radio Ibrahim Al-Akdar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.volume_up,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.02),
            Container(
              height: screenSize.height * 0.06,
              width: double.infinity,
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) => RadioItem(),
                    itemCount: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
