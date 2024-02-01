import 'package:flutter/material.dart';

class customMostPopularButton extends StatelessWidget{
  final Function()? function;
  final String text;
  final bool selected;


  const customMostPopularButton({super.key, required this.function,required this.text, this.selected = false,});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 35,
      width: text.length *15,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width:2,color: Colors.black)
      ),
      child: GestureDetector(
        onTap: function,
        child: Text(text,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,
          color: selected ? Colors.white : Colors.black,
        )),
      ),
    );
  }}