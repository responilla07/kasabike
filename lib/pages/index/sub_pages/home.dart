import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_logins/social_media_logins.dart';

import '../../../widgets/custom_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green,
              child: Align(
                alignment: Alignment.topCenter, // and bottomLeft
                child: SafeArea(
                  child: Center(
                    child: Text('GMap'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.pink,
              padding: EdgeInsets.all(16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select new journey',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonColor: Colors.blue,
                            function: () async {
                              //
                              var googleAccnt = await Google.login();
                              log('googleAccnt: $googleAccnt');
                            },
                            text: 'Home',
                            textColor: Colors.blue,
                            isSolidColor: false,
                            borderRadius: 8,
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: CustomButton(
                            buttonColor: Colors.blue,
                            function: () {
                              //
                            },
                            text: 'Office',
                            textColor: Colors.blue,
                            isSolidColor: false,
                            borderRadius: 8,
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonColor: Colors.blue,
                            function: () {
                              //
                            },
                            text: 'Discover',
                            textColor: Colors.blue,
                            isSolidColor: false,
                            borderRadius: 8,
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: CustomButton(
                            buttonColor: Colors.blue,
                            function: () {
                              //
                            },
                            text: 'Create new +',
                            textColor: Colors.blue,
                            isSolidColor: false,
                            borderRadius: 8,
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
