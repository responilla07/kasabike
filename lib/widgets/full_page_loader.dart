import 'package:flutter/material.dart';

class FullPageLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _dataLoader();
  }

  _dataLoader() {
    return Scaffold(
      backgroundColor: Colors.blue[100].withOpacity(.3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
