import 'package:flutter/material.dart';
import 'constant.dart';

class AuthButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback login;
  const AuthButton({Key? key, required this.formKey,required this.login}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Constants.primaryColor)),
          onPressed: () {
            if (formKey.currentState!.validate()){
              // Navigator.of(context).pushReplacementNamed('navigation');
              login();

            }
          },
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 20, color: Colors.black),
          )),
    );
  }
}
