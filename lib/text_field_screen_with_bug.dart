

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_widget.dart';

class TextFieldBugScreen extends StatefulWidget {
  final ValueNotifier<List<String>> textFieldScreenAnalytics;

  const TextFieldBugScreen({
    required this.textFieldScreenAnalytics,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldBugScreen> createState() => _TextFieldBugScreenState();
}

class _TextFieldBugScreenState extends State<TextFieldBugScreen> {
  @override
  void initState() {
    super.initState();
    _updateAnalytics("Init is called");
  }

  void _updateAnalytics(String newValue) {
    if (kDebugMode) {
      print(newValue);
    }
    widget.textFieldScreenAnalytics.value=[newValue,... widget.textFieldScreenAnalytics.value];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateAnalytics("DidChangeDependencies is called");
  }

  @override
  Widget build(BuildContext context) {
    _updateAnalytics("Build is called");
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Scaffold(
          appBar: AppBar(
            title: ValueListenableBuilder(
              valueListenable: widget.textFieldScreenAnalytics,
              builder: (context,value,child) {
                return Text(
                  "Latest At Top : ${widget.textFieldScreenAnalytics.value.length} Result",
                );
              }
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const BottomSheetWidget();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.visibility,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: widget.textFieldScreenAnalytics,
              builder: (context,value,child) {
                return SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      for (int i=0;i<widget.textFieldScreenAnalytics.value.length;i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "${widget.textFieldScreenAnalytics.value.length-i}) ${widget.textFieldScreenAnalytics.value[i]}",
                          ),
                        ),
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant TextFieldBugScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateAnalytics("DidUpdateWidget is called");
  }

  @override
  void deactivate() {
    super.deactivate();
    _updateAnalytics("Deactivate is called");
  }

  @override
  void dispose() {
    super.dispose();
    _updateAnalytics("Dispose is pressed");
    _updateAnalytics("------------------------------------");

  }
}
