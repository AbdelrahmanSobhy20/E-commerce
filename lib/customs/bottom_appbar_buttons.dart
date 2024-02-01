import 'package:flutter/material.dart';

class bottomButton extends StatelessWidget{
  final String text ;
  final IconData icon;
  final Function()? function;
  final bool selected;

  bottomButton({required this.text ,required this.icon,required this.function,this.selected = false});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          Icon(icon,color: selected ? Colors.black : Colors.grey,),
          Text(text,style: TextStyle(fontWeight: FontWeight.w700,fontSize:12,letterSpacing:0.2,color: selected ?  Colors.black: Colors.grey),),
        ],
      ),
    );
  }

}