import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/color_pallete.dart';

class SlicingHomePage extends StatelessWidget {
  const SlicingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actionsIconTheme: IconThemeData(color: Colors.white),
        title: Text("Hi, Gustav", style: TextStyle(color: Colors.white)),
      ),
      endDrawer: Drawer(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 5,
            color: primaryColor,
          ),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 4,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Text(
                        "Sunday, 15 Agust 2025",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "You are in are",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("No Available", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [Text("Clock In"), Text("08:00")]),
                          SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              color: primaryColor,
                              thickness: 2,
                              width: 3,
                            ),
                          ),
                          Column(children: [Text("Clock Out"), Text("16:00")]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 2,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: ExpandablePanel(
                  header: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: primaryColor),
                    ),
                    child: Text("My Benefit"),
                  ),
                  collapsed: SizedBox(),
                  expanded: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.blue[300],
                        child: Column(children: [Text("Leave"), Text("xxxx")]),
                      ),
                      Container(
                        color: Colors.blue[300],
                        child: Column(
                          children: [Text("Medical"), Text("xxxx")],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Our Services"), Text("See All")],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 5,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.precision_manufacturing),
                              Text("Title ke-$index"),
                            ],
                          ),
                          SizedBox(width: 60, child: Divider(thickness: 2)),
                          Text("Data PEnding"),
                          Text("Data PEnding"),
                          Text("Data PEnding"),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("View All"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
