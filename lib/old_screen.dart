import 'package:flutter/material.dart';

import 'constants/colors.dart';

class hhhh extends StatelessWidget {
  const hhhh({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(25),
//padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      height: 120,
      child: Row(
        children: [
          VerticalDivider(
            color: Color(0xFF5D9CEC),
            thickness: 3,
// height: 100,
            endIndent: 10,
            indent: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Play basket ball"),
              SizedBox(height: 5,),
              Row(

                children: [
                  ImageIcon(AssetImage("assets/images/Group 21.png"),),
                  SizedBox(width: 5,),
                  Text("10:30 AM"),
                ],
              ),


            ],
          ),
          Spacer(),
          Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: tdBlue
              ),
              child: ImageIcon(AssetImage("assets/images/icon_check.png"))),
        ],
      ),
    );
  }
}
