import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Container(
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
                icon: Icon(Icons.favorite, size: 30, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_arrow, size: 30, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.volume_up, size: 30, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
