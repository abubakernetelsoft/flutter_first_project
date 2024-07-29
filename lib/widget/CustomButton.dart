
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{
  final String text;
  final Color? bgColor ;
  final Icon? iconBtn;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  RoundedButton({required this.text,
    this.bgColor = Colors.blue,
    this.iconBtn, this.textStyle,
      this.callBack});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      callBack!();
    }, child: iconBtn!= null ? Container(width: 100,
      child: Row(
        mainAxisAlignment : MainAxisAlignment.center ,children: [
        iconBtn!,
        Text(text , style:  textStyle)],),
    )  : Text(text , style:  textStyle),
    style: ElevatedButton.styleFrom(
        backgroundColor : bgColor,
      shadowColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
        topRight: Radius.circular(15)))
      )
    )
    ;
  }
  
}