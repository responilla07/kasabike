import 'package:flutter/material.dart';
import 'package:kasabike/data/global.dart';
import 'package:kasabike/widgets/custom_button.dart';
import 'package:kasabike/widgets/custom_field.dart';

import '../pages/index/sub_pages/home/select_search_new_journey.dart';

class ShowSearchCreateJourney extends StatefulWidget {
  const ShowSearchCreateJourney({
    @required this.callback,
  });

  final Function(dynamic) callback;

  @override
  _ShowSearchCreateJourneyState createState() =>
      _ShowSearchCreateJourneyState();
}

class _ShowSearchCreateJourneyState extends State<ShowSearchCreateJourney> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(bottom: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      children: [
        SelectSearchJourney(
          callback: (bool redirected, var data) {
            if (data != null) {
              widget.callback(data);
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}

class ShowReportLocation extends StatefulWidget {
  const ShowReportLocation({
    @required this.callback,
  });

  final Function(dynamic) callback;

  @override
  _ShowReportLocationState createState() => _ShowReportLocationState();
}

class _ShowReportLocationState extends State<ShowReportLocation> {
  TextEditingController _textEditingController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(bottom: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      children: [
        Container(
          height: 250,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Text(
                    'Note* Please pull over before sending a report.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Enter details',
                    textEditingController: _textEditingController,
                    expands: true,
                    borderRadius: 8,
                  ),
                ),
                SizedBox(height: 16),
                CustomButton(
                  buttonColor: Colors.red,
                  function: () async {
                    if (_textEditingController.text.isNotEmpty) {
                      Navigator.pop(context);
                    } else {
                      showScaffoldMessage(
                        context: context,
                        message: "Please enter a details why you want to report it."
                      );
                    }
                  },
                  text: 'Send Report',
                  textColor: Colors.white,
                  borderRadius: 8,
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
