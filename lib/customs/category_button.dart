import 'package:flutter/material.dart';

class customButton extends StatelessWidget{
  final String icon;
  final Function()? funtion;
  final String text;

  const customButton({super.key, required this.icon, required this.funtion,required this.text});

  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30)
          ),
          child: GestureDetector(
            onTap: funtion,
            child: Image.asset(icon,height: 30,width: 30),
          ),
        ),

        Text(text,style: TextStyle(fontWeight: FontWeight.w600,letterSpacing:.02),),

      ],

    );
  }

}