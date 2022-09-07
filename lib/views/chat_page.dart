import 'package:chat_ui/views/style.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5b61b9),
      body: ListView(
        children: [
          CustomApp(),
          header(),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}

Padding header() {
  return Padding(
    padding: EdgeInsets.only(left: 40, top: 20, bottom: 40,right: 30),
    child: Row(
      children: [
        PrimaryText(
          text: 'Tannaz\nSadeghi',
          size: 32,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
        Spacer(),
        RawMaterialButton(
          constraints: BoxConstraints(minWidth: 0),
          fillColor: Colors.white38,
          shape: CircleBorder(),
          elevation: 2.0,
          padding: EdgeInsets.all(7),
          onPressed: () {},
          child: Icon(
            Icons.call,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 5,),
        RawMaterialButton(
          constraints: BoxConstraints(minWidth: 0),
          fillColor: Colors.white38,
          shape: CircleBorder(),
          elevation: 2.0,
          padding: EdgeInsets.all(7),
          onPressed: () {},
          child: Icon(
            Icons.call,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
