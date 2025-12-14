import 'package:flutter/material.dart';

class SecondBody extends StatefulWidget {
  const SecondBody({super.key});

  @override
  State<SecondBody> createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset('assets/images/images.png'),
        Image.network('https://i.ytimg.com/vi/w6hxlsZJlxE/maxresdefault.jpg'),
      ],
    );
  }
}
