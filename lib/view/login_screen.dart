import 'package:e_commerce/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../API/get_users.dart';
import '../customs/route_text.dart';
import '../sql/usersSQL.dart';
import '../sql/sqlModels/users.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //we have to make global key for our form
  final formKey = GlobalKey<FormState>();
  //toggle the password
  bool isVisible =false;
  bool isLoginTrue =false;

  final db = DatabaseHelper();
  login()async{
    var response = await db.login(Users(userEmail : emailController.text, userPassword: passController.text));

    if(response == true){
      if(!mounted) return;
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
      Navigator.of(context).pushReplacementNamed('navigation');
    }else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
                "assets/Tablet login-amico.png",
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
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
                  const SizedBox(height: 30),
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
                ],
              ),
            ),
            //const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Color(0xff0e375f)),
                  minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.sizeOf(context).width - 50, 50))),
              onPressed: () {
                getuser(context, emailController.text, passController.text);
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You are new here? '),
                RouteText(
                    text: 'Sign Up',
                    funtion: () async {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.setString('email', emailController.text);
                      prefs.setString('pass', passController.text);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen()));
                    })
              ],
            ),

            isLoginTrue? const Text(
              "Username or Password is incorrect",
              style: (TextStyle(color: Colors.red)),) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
