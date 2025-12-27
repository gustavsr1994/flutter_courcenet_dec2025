import 'package:flutter/material.dart';
import 'package:flutter_courcenet_dec2025/color_pallete.dart';
import 'package:flutter_courcenet_dec2025/statemanagement/provider/auth_controller.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => controller.changeForm(),
            child: Text(
              controller.isRegisterPage
                  ? 'Change to Form Login'
                  : 'Change to Form Register',
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
            child:
                controller.isRegisterPage
                    ? bodyRegister(controller)
                    : bodyLogin(controller),
          ),
        ],
      ),
    );
  }

  Widget bodyLogin(AuthController controller) {
    return Form(
      key: controller.keyFormLogin,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: controller.usernameField,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please, this field ';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.man),
                labelText: 'Username',
                hintText: 'Insert your username',
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: controller.passwordField,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please, this field ';
                }
                return null;
              },
              obscureText: controller.isVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.man),
                suffixIcon: IconButton(
                  onPressed: () => controller.changeVisible(),
                  icon: Icon(
                    controller.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                labelText: 'Password',
                hintText: 'Insert your password',
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => controller.actionLogin(),
            child: Text("Login"),
          ),
          ElevatedButton(
            onPressed: () => controller.actionLoginGmail(),
            child: Text("Login with Gmail"),
          ),
        ],
      ),
    );
  }

  Widget bodyRegister(AuthController controller) {
    return Form(
      key: controller.keyFormRegister,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: controller.usernameField,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please, this field ';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.man),
                labelText: 'Username',
                hintText: 'Insert your username',
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: controller.emailField,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please, this field ';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.man),
                labelText: 'Email',
                hintText: 'Insert your email',
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: controller.passwordField,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please, this field ';
                }
                return null;
              },
              obscureText: controller.isVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                prefixIcon: Icon(Icons.man),
                suffixIcon: IconButton(
                  onPressed: () => controller.changeVisible(),
                  icon: Icon(
                    controller.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                labelText: 'Password',
                hintText: 'Insert your password',
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => controller.actionRegister(),
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}
