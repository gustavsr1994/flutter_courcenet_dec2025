import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/home_controller.dart';
import 'package:provider/provider.dart';

class FirstBody extends StatefulWidget {
  String name;
  FirstBody(this.name, {super.key});

  @override
  State<FirstBody> createState() => _FirstBodyState();
}

class _FirstBodyState extends State<FirstBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: MediaQuery.sizeOf(context).height / 2,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      margin: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.greenAccent, width: 3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, ${widget.name}"),
            Icon(Icons.star),
            Icon(Icons.star, size: 50),
            Stack(
              children: [
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    padding: EdgeInsets.all(3),
                    child: Text(
                      "2",
                      style: TextStyle(fontSize: 10, color: Colors.yellow),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                onPressed:
                    () =>
                        context.read<HomeController>().changeColor(Colors.yellow),
                child: Text("Change Yellow"),
                            ),
                            ElevatedButton(
                onPressed:
                    () =>
                        context.read<HomeController>().changeColor(Colors.green),
                child: Text("Change Green"),
                            ),
                            ElevatedButton(
                onPressed:
                    () => context.read<HomeController>().changeColor(Colors.red),
                child: Text("Change Red"),
                            ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
