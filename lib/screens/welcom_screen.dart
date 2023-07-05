import 'package:firebase_chat_project/screens/regist_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../elements/buttons.dart';
import 'login_screen.dart';


class WelcomScreen extends StatefulWidget {
   const WelcomScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      upperBound: 1,
      //100.0,
    );
    //-----
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    animation2 = ColorTween(
      begin: const Color.fromARGB(255, 129, 129, 132),
      end: const Color.fromARGB(255, 252, 252, 251),
    ).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation2.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 48.0,
            ),
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: animation.value * 100,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 82, 81, 81),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            ButtonWidget(
                color: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
             ButtonWidget(
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistScreen.id);
                }),
            
          ],
        ),
      ),
    );
  }
}
