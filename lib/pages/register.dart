import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kasabike/main.dart';

class Register extends StatefulWidget {
  // const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isObscure = true;
  bool _isObscure2 = true;

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
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "First name",
                      suffixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Last Name",
                      suffixIcon: Icon(Icons.person)),
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
                TextField(
                  obscureText: _isObscure2,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password confirm",
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure2
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
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
                    child: const Text("Sign Up")),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Or sign up with",
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
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ));
                        },
                        child: const Text("Login Instead"))
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
