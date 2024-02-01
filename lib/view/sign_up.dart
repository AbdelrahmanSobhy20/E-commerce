import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../API/get_users.dart';
import '../customs/route_text.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {

  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey =GlobalKey<FormState>();
  bool isVisible=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 400,
              child: Image.asset(
                "assets/1.png",
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType:TextInputType.name,
                    decoration: const InputDecoration(
                        labelText: 'Enter User Name',
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)))),
                    controller: nameController,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$").hasMatch(value)) {
                        return "Invalid email format";
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType:TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Enter Email',
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\_$&*~]).{8,}$').hasMatch(value)) {
                        return "Invalid password format";
                      }
                      return null;
                    },
                    keyboardType:TextInputType.visiblePassword,
                    controller: passController,
                    decoration: InputDecoration(
                      labelText: 'Enter Password',
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                        icon: Icon(isVisible? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          }); },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\_$&*~]).{8,}$').hasMatch(value)) {
                        return "Invalid password format";
                      }else if (passController.text != confirmPassController.text){
                        return "password doesn't match";
                      }
                      return null;
                    },
                    controller: confirmPassController,
                    keyboardType:TextInputType.visiblePassword,
                    //obscureText:!isVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                        icon: Icon(isVisible? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          }); },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //sign up button
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Color(0xff0e375f)),
                  minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.sizeOf(context).width - 50, 50))),
              onPressed: () {
                getuser(context, emailController.text, passController.text);
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have an account? '),
                RouteText(
                    text: 'Sign In',
                    funtion: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('email', emailController.text);
                      prefs.setString('pass', passController.text);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
