import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/provider_controller.dart';
import 'package:provider/provider.dart';

class SecondBody extends StatefulWidget {
  const SecondBody({super.key});

  @override
  State<SecondBody> createState() => _SecondBodyState();
}

class _SecondBodyState extends State<SecondBody> {
  @override
  Widget build(BuildContext context) {
    final item = context.watch<ProviderController>();
    return ListView(
      children: [
        item.visibleImageNetwork
            ? Image.network(
              'https://i.ytimg.com/vi/w6hxlsZJlxE/maxresdefault.jpg',
            )
            : Image.asset('assets/images/images.png'),
        ElevatedButton(onPressed: () => item.changeStatus(), child: Text("Change"))
      ],
    );
  }
}
