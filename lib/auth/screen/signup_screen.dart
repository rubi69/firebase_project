import 'package:firebase_project/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../common/common_textfield.dart';
import '../../common/custom_button.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService authService = AuthService();
  final TextEditingController nameController = TextEditingController();
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 
  final TextEditingController contactController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signUpUser() {
    authService.registerUser(context: context,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phoneNumber: contactController.text.trim());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    
    emailController.dispose();
    passwordController.dispose();
    
    contactController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        title: const Text("Sign Up Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextField(
                      controller: nameController,
                      hintText: " Name",
                      icon: Icons.person),
                  SizedBox(
                    height: 15,
                  ),
                  
                  SizedBox(
                    height: 15,
                  ),
                  CommonTextField(
                      controller: emailController,
                      hintText: "Email",
                      icon: Icons.email),
                  SizedBox(
                    height: 15,
                  ),
                  CommonTextField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: "Password",
                      icon: Icons.key),
                  SizedBox(
                    height: 15,
                  ),
                 
                  SizedBox(
                    height: 15,
                  ),
                  CommonTextField(
                      keyboardType: TextInputType.phone,
                      controller: contactController,
                      hintText: "Contact",
                      icon: Icons.call),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          signUpUser();
                        }
                      },
                      text: "Sign Up"),
                  SizedBox(
                    height: 15,
                  ),
                  // CommonbButton(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, 'home_screen');
                  //     },
                  //     text: " Go to Login Page"),
                ],
              ),
            )),
      ),
    );
  }
}