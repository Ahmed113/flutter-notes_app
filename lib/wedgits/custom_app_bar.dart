
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.noteAppbar, required this.iconAppbar, this.onPress}) : super(key: key);

  final String noteAppbar;
  final IconData iconAppbar;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(noteAppbar,
        style: const TextStyle(
          fontSize: 28
        ),),
        const Spacer(flex: 1,),
         CustomIconWedgit(
           iconData: iconAppbar,
           onPress: onPress,
         ),
      ],
    );
  }
}



