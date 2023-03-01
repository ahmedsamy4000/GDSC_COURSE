import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVisible = false;
  bool textVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                color: Colors.deepPurple,
                child: const Center(
                    child: Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                )),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: Column(
                  children: [
                    textItem(
                        textFieldName: 'Full Name',
                        prefixIcon: Icons.person_2_outlined,
                        type: TextInputType.name),
                    textItem(
                        textFieldName: 'Email',
                        prefixIcon: Icons.email_outlined,
                        type: TextInputType.emailAddress),
                    passwordTextItem(
                      textFieldName: 'Password',
                      prefixIcon: Icons.lock_open_rounded,
                      suffixIcon:
                          isVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    passwordTextItem(
                      textFieldName: 'Confirm Password',
                      prefixIcon: Icons.lock_open_rounded,
                      suffixIcon:
                          isVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    textItem(
                      textFieldName: 'Phone',
                      prefixIcon: Icons.phone_android_outlined,
                      type: TextInputType.phone,
                    ),
                    button('SignUp', Colors.white, Colors.deepPurple, false),
                    button('Login', Colors.deepPurple, Colors.white, true)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textItem(
      {String? textFieldName, IconData? prefixIcon, TextInputType? type}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: Colors.black12,
        ),
        child: TextFormField(
          keyboardType: type,
          style: const TextStyle(fontSize: 13, color: Colors.deepPurple),
          decoration: InputDecoration(
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
            fillColor: Colors.white60,
            prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  prefixIcon,
                  size: 20,
                  color: Colors.deepPurple,
                )),
            labelText: textFieldName,
          ),
        ),
      ),
    );
  }

  Widget passwordTextItem({
    String? textFieldName,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: Colors.black12,
        ),
        child: TextField(
          style: const TextStyle(fontSize: 13, color: Colors.deepPurple),
          obscureText: isVisible,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
            fillColor: Colors.white60,
            prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  prefixIcon,
                  size: 20,
                  color: Colors.deepPurple,
                )),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(
                  suffixIcon,
                  size: 20,
                  color: Colors.deepPurple,
                ),
                onPressed: () {
                  setState(() {
                    isVisible ? isVisible = false : isVisible = true;
                  });
                },
              ),
            ),
            labelText: textFieldName,
          ),
        ),
      ),
    );
  }

  Widget button(
      String title, Color textColor, Color backGroundColor, bool enableBorder) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: enableBorder ? Border.all(width: 1) : Border.all(width: 0),
            color: backGroundColor,
            borderRadius: BorderRadius.circular(8.0)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextButton(
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 20),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
