import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      height: size.height/1.5,
      width: size.width,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: SizedBox(
          height: size.height/1.5,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Enter anything",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text("Name"),
                ),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  label: Text("Phone"),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Done",
                  ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
