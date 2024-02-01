import 'package:e_commerce/view/splash/splash1.dart';
import 'package:flutter/material.dart';

class Splash0 extends StatelessWidget {
  const Splash0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1d4670),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Splash1()));
        },
        child: const Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircularProgressIndicator(
              color: Colors.white,
              strokeAlign: BorderSide.strokeAlignInside,
            )
          ]),
        ),
      ),
    );
  }
}
