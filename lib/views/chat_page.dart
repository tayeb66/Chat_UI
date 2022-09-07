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
                borderRadius: BorderRadius.circular(40), color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 310,
                ),
               footerInput(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Padding footerInput(){
  return  Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Enter your message...',
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        hintStyle: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.w500),
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
          BorderSide(width: 0, style: BorderStyle.none),
        ),
        suffixIcon:  RawMaterialButton(
          constraints: BoxConstraints(minWidth: 0),
          fillColor: Color(0xff5b61b9),
          shape: CircleBorder(),
          elevation: 2.0,
          padding: EdgeInsets.all(3),
          onPressed: () {},
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Padding header() {
  return Padding(
    padding: EdgeInsets.only(left: 40, top: 20, bottom: 40, right: 30),
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
        SizedBox(
          width: 5,
        ),
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
