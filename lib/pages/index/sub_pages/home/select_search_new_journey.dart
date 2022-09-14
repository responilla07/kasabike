import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kasabike/data/global.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_field.dart';
import 'search_list.dart';

class SelectSearchJourney extends StatefulWidget {
  const SelectSearchJourney({
    @required this.callback,
  });

  final Function callback;
  @override
  _SelectSearchJourneyState createState() => _SelectSearchJourneyState();
}

class _SelectSearchJourneyState extends State<SelectSearchJourney> {
  TextEditingController _textEditingController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                widget.callback(true, null);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapSearchList(),
                    settings: RouteSettings(name: 'MapSearchList' ?? ""),
                  ),
                ).then((value) {
                  widget.callback(false, value);
                });
              },
              child: CustomTextField(
                hintText: 'Search for new journey',
                textEditingController: _textEditingController,
                borderRadius: 8,
                enabled: false,
                suffixIcon: Icon(Icons.search),
                contentPadding: null,
              ),
            ),
            SizedBox(height: 24),
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
    );
  }
}
