import 'package:flutter/material.dart';

import '../const.dart';

class PrimaryText extends StatelessWidget {

  final String? text;
  final Color? color;
  final FontWeight fontWeight;
  final double size;
  final TextOverflow overflow;

  const PrimaryText({super.key,
    this.text,
    this.color = Colors.black,
    this.size = 16,
    this.fontWeight = FontWeight.w700,
    this.overflow = TextOverflow.visible,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: size,
          color: color,
          fontWeight: fontWeight),
    );
  }
}

class Avatar extends StatelessWidget {
 final String? imagePath;
 final double? height;
 final double? weight;

 const Avatar({super.key, required this.imagePath,this.height = 60,this.weight = 60});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height!,
      width: weight!,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
              image: AssetImage(imagePath ?? ''),
              fit: BoxFit.cover)),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 30),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrimaryText(
              text: 'Chat with\nyour friends',
              fontWeight: FontWeight.w900,
              color: Colors.white,
              size: 32),
          const SizedBox(height: 20,),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: avatarList.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Avatar(imagePath: avatarList[index]['avatar'],),
                );
              },

            ),
          ),
        ],
      ),
    );
  }
}

class CustomApp extends StatelessWidget {
  const CustomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Back',
              style: TextStyle(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Search',
              style: TextStyle(color: Colors.white54),
            ),
          )
        ],
      ),
    );
  }
}



