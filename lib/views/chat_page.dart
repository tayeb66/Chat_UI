import 'package:chat_ui/const.dart';
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
                Container(
                  height: MediaQuery.of(context).size.height - 310,
                  padding: EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) =>
                    messages[index]['from'] == 'sender'
                        ? senderMessage(messages[index]['message'],
                        messages[index]['time'])
                        : receiverMessage(messages[index]['message'],
                        messages[index]['time']),
                  ),
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

// Message Send
Widget senderMessage(String? message, String? time) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrimaryText(text: time, size: 14, color: Colors.grey[400]),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(0))),
          child: PrimaryText(text: message, color: Colors.black38, size: 14),
        ),
      ],
    ),
  );
}

Widget receiverMessage(String? message, String? time) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Avatar(
              imagePath: 'assets/images/avatar-1.png',
              height: 30,
              weight: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(25))),
              child:
                  PrimaryText(text: message, color: Colors.black38, size: 14),
            ),
          ],
        ),
        Spacer(),
        PrimaryText(text: time, size: 14, color: Colors.grey[400]),
      ],
    ),
  );
}

// footer part
Padding footerInput() {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Enter your message...',
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintStyle:
            TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500),
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        suffixIcon: RawMaterialButton(
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

// header part
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
