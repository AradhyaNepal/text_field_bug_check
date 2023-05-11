import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final ValueNotifier<List<String>> textFieldScreenAnalytics;

  const WelcomeScreen({
    required this.textFieldScreenAnalytics,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.blue.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Text(
                          "Welcome to My App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You are going to see a TextField Bug",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "In this bug, page is being rebuild when user change TextField type inside bottom sheet",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder(
                  valueListenable: textFieldScreenAnalytics,
                  builder: (context,value,child) {
                    return ElevatedButton(
                      onPressed: () {
                        textFieldScreenAnalytics.value=["------------------------------------"];
                      },
                      child: Text("Clear Analytics: ${textFieldScreenAnalytics.value.length} items"),
                    );
                  }
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Scroll Down to see the Bug.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.arrow_downward,
                  size: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
