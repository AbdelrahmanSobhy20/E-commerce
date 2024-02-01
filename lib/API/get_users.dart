import 'dart:convert';
import 'package:e_commerce/view/home_screen.dart';
import 'package:e_commerce/view/navigation_menue.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/check_user.dart';
import '../view/profile/profile_screen.dart';

Future<void> getuser(BuildContext context, String email, String Pass) async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/users'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);

    Map<String, dynamic>? foundUser = jsonData.firstWhere(
      (user) =>
          (user['email'] == email || user['username'] == email) &&
          user['password'] == Pass,
      orElse: () => null,
    );

    if (foundUser != null) {
      Provider.of<UserProvider>(context, listen: false).ImageChoice(
        foundUser["id"],
      );
      Provider.of<UserProvider>(context, listen: false).setResult(
        "${foundUser['name']['firstname']} ${foundUser['name']['lastname']}",
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NAV()));
    } else {
      Provider.of<UserProvider>(context, listen: false)
          .setResult("User not found");
      showDialog<void>(
        context: context,
        builder: (context) {
          return const UserAlert();
        },
      );
    }
  } else {
    Provider.of<UserProvider>(context, listen: false).setResult(
      "Failed to fetch data. Status code: ${response.statusCode}",
    );
  }
}

class UserAlert extends StatefulWidget {
  const UserAlert({super.key});

  @override
  State<UserAlert> createState() => _UserAlertState();
}

class _UserAlertState extends State<UserAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        "Alert!!!",
        style: TextStyle(
            color: Colors.red, fontSize: 28, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        "You should sign up first!",
        style: TextStyle(
            color: Color(0xff0e375f),
            fontSize: 23,
            fontWeight: FontWeight.w400),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xff0e375f)),
                    minimumSize: MaterialStatePropertyAll(
                        Size(MediaQuery.sizeOf(context).width - 300, 30))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ],
    );
  }
}
