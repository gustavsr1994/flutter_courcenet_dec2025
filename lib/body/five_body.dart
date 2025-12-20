import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/bloc/bloc_controller.dart';

class FiveBody extends StatelessWidget {
  const FiveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<BlocController, String>(
          builder: (context, state) {
            return Text("Buah: $state", style: TextStyle(fontSize: 25));
          },
        ),
        BlocBuilder<BlocController, String>(
          builder: (context, state) {
            return DropdownButton(
                  value: state,
                  items: [
                    DropdownMenuItem(child: Text("Apel"), value: 'apel'),
                    DropdownMenuItem(child: Text("Jeruk"), value: 'jeruk'),
                    DropdownMenuItem(child: Text("Anggur"), value: 'anggur'),
                  ],
                  onChanged: (value) => context.read<BlocController>().onSelectDropdown(value!),
                );
          },
        ),
      ],
    );
  }
}
