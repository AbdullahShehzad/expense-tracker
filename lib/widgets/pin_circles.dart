import 'package:flutter/material.dart';

class MyIconsRow extends StatelessWidget {
  // This condition controls whether the icons are outlined or filled
  final bool isOutlined;

  MyIconsRow({Key? key, required this.isOutlined}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the icon type based on the condition
    IconData iconData = isOutlined ? Icons.circle_outlined : Icons.circle;
    final Color oc = isOutlined ? Color(0xFFE9AB17).withOpacity(57) : Color(0xFFE9AB17);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(iconData, color: oc, size: 32,),
          Icon(iconData, color: oc, size: 32,),
          Icon(iconData, color: oc, size: 32,),
          Icon(iconData, color: oc, size: 32,),
        ],
      ),
    );
  }
}