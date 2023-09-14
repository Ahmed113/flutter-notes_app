import 'package:flutter/material.dart';

class CustomIconWedgit extends StatelessWidget {
  const CustomIconWedgit({Key? key, required this.iconData, this.onPress}) : super(key: key);

  final IconData iconData;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        icon: Icon(iconData),
        iconSize: 28,
        onPressed: onPress,),
    );
  }
}