import 'package:firebase_project/auth/screen/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../common/common_dialog.dart';
import '../../common/common_textfield.dart';
import '../../common/custom_button.dart';
import '../../ulist/utils.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void loginUser() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBar(context, "please enter all the required field");
    }
    else {
      showDialogBox(context: context, text: "Login in...");
     authService.loginUser(context: context,
    
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }
  }


  @override
  Widget build(BuildContext context) {
    // String imageUrl = "https://logowik.com/flutter-vector-logo-5285.html";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Center(
          child: Form(
            key: formKey,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Flutter",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
                CommonTextField(controller: emailController, hintText: "Email", icon: Icons.email),
                SizedBox(
                  height: 15,
                ),
                CommonTextField(
                    obscureText: true, controller: passwordController, hintText: "Password", icon: Icons.key),
                SizedBox(
                  height: 10,
                ),
                Text("Forget Password?",
                    style: TextStyle(
                      color: Colors.blue,
                    )
                ),
                SizedBox(
                  height: 20,
                ),

                CustomButton(onTap: (){
                  // Navigator.pushNamed(context, SingleValueScreen.routeName, arguments: "App BAr Text",);
                  //Navigator.pushNamed(context, MultipleValueScreen.routeName, arguments: {"text": "Hello", "bodytext": "World"},);

                  loginUser();
                }, text: "Login"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New User?"),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                      },
                      child: Text(
                        "Create a new Account",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}