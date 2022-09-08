import 'package:chat_ui/const.dart';
import 'package:chat_ui/views/style.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5b61b9),
      body: ListView(
        shrinkWrap: true,
        children: [
          const CustomApp(),
          header(),
          Container(
            height: MediaQuery.of(context).size.height - 230,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0)),
                color: Colors.white),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 310,
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) => messages[index]['from'] ==
                            'sender'
                        ? senderMessage(
                            messages[index]['message'], messages[index]['time'])
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
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
            const Avatar(
              imagePath: 'assets/images/avatar-1.png',
              height: 30,
              weight: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(25))),
              child:
                  PrimaryText(text: message, color: Colors.black38, size: 14),
            ),
          ],
        ),
        const Spacer(),
        PrimaryText(text: time, size: 14, color: Colors.grey[400]),
      ],
    ),
  );
}

// footer part
Padding footerInput() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Enter your message...',
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintStyle:
            TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500),
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        suffixIcon: RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 0),
          fillColor: const Color(0xff5b61b9),
          shape: const CircleBorder(),
          elevation: 2.0,
          padding: const EdgeInsets.all(3),
          onPressed: () {},
          child: const Icon(
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
    padding: const EdgeInsets.only(left: 40, top: 20, bottom: 40, right: 30),
    child: Row(
      children: [
        const PrimaryText(
          text: 'Tannaz\nSadeghi',
          size: 32,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
        const Spacer(),
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 0),
          fillColor: Colors.white38,
          shape: const CircleBorder(),
          elevation: 2.0,
          padding: const EdgeInsets.all(7),
          onPressed: () {},
          child: const Icon(
            Icons.call,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 0),
          fillColor: Colors.white38,
          shape: const CircleBorder(),
          elevation: 2.0,
          padding: const EdgeInsets.all(7),
          onPressed: () {},
          child: const Icon(
            Icons.video_call,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
