import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kasabike/pages/register.dart';

class Login extends StatefulWidget {
  // const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/logo.svg',
                      width: 60,
                      fit: BoxFit.contain,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Kasabike',
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 56,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Email",
                      suffixIcon: Icon(Icons.email)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      )),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40)),
                    onPressed: () {
                      //todo: add navigator here
                    },
                    child: const Text("Sign In")),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Or sign in with",
                  style: TextStyle(color: Colors.black45),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          'images/google.png',
                          width: 48,
                          fit: BoxFit.contain,
                        )),
                    SizedBox(width: 32),
                    TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          'images/facebook.png',
                          width: 48,
                          fit: BoxFit.contain,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ));
                        },
                        child: const Text("Create Account"))
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
