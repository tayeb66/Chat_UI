import 'package:chat_ui/const.dart';
import 'package:chat_ui/views/chat_page.dart';
import 'package:chat_ui/views/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5b61b9),
      body: ListView(
        children: [
          const Header(),
          Container(
            padding: EdgeInsets.only(top: 40,right: 20,left: 20),
            height: MediaQuery.of(context).size.height - 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.white),
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage()));
                    },
                    leading: Avatar(imagePath: userList[index]['avatar']),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(userList[index]['name'] ?? ''),
                        Text(
                          userList[index]['time'] ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        )
                      ],
                    ),
                    subtitle: Text(
                      userList[index]['message'] ?? '',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
