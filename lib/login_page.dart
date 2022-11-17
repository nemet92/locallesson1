import 'package:flutter/material.dart';
import 'package:lessonlocal/login_request_model.dart';
import 'package:lessonlocal/network.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  WebService webService = GlobalDio();

  final TextEditingController _userNameTexteditingController =
      TextEditingController();
  final TextEditingController _passwordTexteditingController =
      TextEditingController();

  Future<void> sendItemsToWebservice(
      LoginRequestModel loginRequestModel) async {
    webService.login(loginRequestModel);
  }

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userNameTexteditingController,
              decoration: const InputDecoration(
                hintText: "UserName",
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordTexteditingController,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.key_rounded),
                suffixIcon: Icon(Icons.visibility_rounded),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      // if (_userNameTexteditingController.text.isNotEmpty &&
                      //     _passwordTexteditingController.text.isNotEmpty) {
                      //   final loginRequestModel = LoginRequestModel(
                      //     userName: _userNameTexteditingController.text,
                      //     password: _passwordTexteditingController.text,
                      //   );

                      //   sendItemsToWebservice(loginRequestModel);
                      // }
                    },
                    child: const Text("Sign in")))
          ],
        ),
      ),
    );
  }

  // sign() async {
  //   setState(() {
  //     LoginRequestModel loginRequestModel = LoginRequestModel(
  //         userName: userNameController.text, password: passwordController.text);
  //     var response = webService.login(loginRequestModel);
  //     if (response == true) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const HomePage()),
  //       );

  //       // ignore: use_build_context_synchronously

  //     }
  //   });
  // }
}
