
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  // Variables
  final String? svgName;
  final Widget? icon;
  final String text;

  const NoData(
      {Key? key,
        this.svgName,
        this.icon,
        required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Handle icon
    late Widget _icon;
    // Check svgName
    if (svgName != null) {
      // Get SVG icon
      _icon =  Image.asset("assets/icons/$svgName.png",
          width: 100, height: 100, color: Theme.of(context).primaryColor);
    } else {
      _icon = icon!;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Show icon
          _icon,
          // const SizedBox(height: 10),
          Text(text,
              style: const TextStyle(fontSize: 18, color:  Color(0xff0E2764)), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
