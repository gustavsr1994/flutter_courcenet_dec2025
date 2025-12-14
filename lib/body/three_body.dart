import 'package:flutter/material.dart';

class ThreeBody extends StatefulWidget {
  const ThreeBody({super.key});

  @override
  State<ThreeBody> createState() => _ThreeBodyState();
}

class _ThreeBodyState extends State<ThreeBody> {
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 10));
    return "Hello";
  }

  Future<String> fetchDataB() async {
    for (var i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 3));
      return 'Hello - $i';
    }
    return '';
  }

  Stream<String> fetchStream() async* {
    for (var i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 3));
      yield "Data ke-$i";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Center(child: Text(snapshot.data!));
              } else {
                return Center(child: Text("No Data"));
              }
            } else {
              return Center(child: Text("No Data"));
            }
          },
        ),
        FutureBuilder(
          future: fetchDataB(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Center(child: Text(snapshot.data!));
              } else {
                return Center(child: Text("No Data"));
              }
            } else {
              return Center(child: Text("No Data 2"));
            }
          },
        ),
        StreamBuilder(
          stream: fetchStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return Center(child: Text(snapshot.data!));
              } else {
                return Center(child: Text("No Data"));
              }
            } else {
              return Center(child: Text("No Data"));
            }
          },
        ),
      ],
    );
  }
}
