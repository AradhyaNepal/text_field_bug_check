import 'package:flutter/material.dart';

class MoreDownScreen extends StatelessWidget {
  const MoreDownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:Icon(
            Icons.arrow_downward,
            size: size.shortestSide/2,
          )
        ),
      ),
    );
  }
}
