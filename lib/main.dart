import 'package:flutter/material.dart';
import 'package:kasabike/pages/chat.dart';
import 'package:kasabike/pages/index.dart';
import 'package:kasabike/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/global.dart';

Future<void> main() async {
  
await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDJTvZA48gGVdT8\ndqvvLZGfK0/J0cnxNm6OGqYqVGsBPEiKMJUt4FYXxUysA3ZgTC6gT18P29yGvc7T\n34u+t+Kabnsj9HMbu12uMvvKdDLx0Wg3sICFVPosYqvoMCcxHkhCp8Mes9pAY1Mb\nBLgC+DUSwXi6DXKS62ukoNqjtVXZY5cETCUrAd4BSQDVaLKH4xMjZJ/wErTALWuU\nPRTYXKh275vVqi5FOqlj1o+8ohSyuAYYyjJZNuMfOTNnK9kr6M5APuwNydMzaf01\n59gAUmAElqSNP5F65J50xLM/vo5BG0260aAnc1qE+VINaUzkHxtACvi8FXaLNqww\nzxf7k3RDAgMBAAECggEAPOupeD+2k7w75V8gbxRSQmIAFmpne5jmYhjMenjrnQca\nSL+lFaoTQ8RQjKnLlB7Z6We7s/fsR9Z/Ff1LtB6/885Fc78Raq4MDqCdNEpv9GBT\n8q52ZmMuBmqh7XVNFv88DPfqA4uYG+4zAzUtXrCwlwl3uI5DQxT9kWegYvSIk22X\nnhZ5APskeo/iKNVuQbgy6Lt6p/xGFHawCNN0clEKztVHeacx/RDg7YrZTtvhj80z\nWFWJ1SZ1o6/6XDfygQx3hnnKKs1nYoXc6AmY/Fs5/D9TsY3wxpkMbw+/N9ZtHFrw\njLGMHVqgpZ4Y7EyyzdJVDUsFou1P/JkQCvS3//h6UQKBgQDpHUG6imXlbLbp8tef\nHk2uOoCTAEBjLZHkgpdtaGqgFnWYvLAoz8RgKviBSmiXuA1XNoNXntr37R+AgFv1\nxz18LCqyod09LAosUqCyRTypo3CQgSFoVrxyZjaTVUf0N5HjCGRVpDLldCmFjwed\nhwlMdP47vNQ6EOM7fm9GqxFQqwKBgQDdElhaPdZITXhNoW0qS8YMY5meh9MRAuiA\n0J/Q85/SS3zIhd71VWnroqL6vWJV/SXpbTsEDL7iqWl0lI9J1FW1dMevjxCOv/B+\nZT1m1parbXVvpHkayzLimOX/SlV+cXg2QeVIxXwkkdC77YkNangDBdtNaPURjDcp\n9j8Y091ayQKBgBzTaVVP19nO369+P/uFG8X3pf6HgW7CK9A99cuppcW2AUSp0H67\ncmUR6zjRoq1gLQYjz4n+MsWFpOeW98gkow2/yGfebCUsVPW2IfjpZt7zPvAfh6oH\nT7Y1vXnqicNBO+D/IKkWbNTC0H+beC2ajSPPM8DfUL79Z5vrvobWkIWRAoGASEEy\nt2v2mXMYmubj8ysI9AuprfLevXSh4VhOo9C8r9MUWcXHdZARKn7hnepANbKjrYOS\nAmTYDuUoHn5fxtWrnb8pdOvhkYaSZ/1W8EG6xRTliTPMkUFQxFcM9T+qacVUcQdg\nlURWqu0tt/6PCN9/kh1b7BUd5Dpb3U8qmEbG1mECgYBX4vQQq+guMXCPQkh0RSyl\nbhAebx230f1c0YrFYfRwV70liBCeMufGlSIxtTurB7WYm5urnbRmcmcpplMl1nve\nAZWfP5JS4atl4QirvmKqpft3HMO/sTNtc4Ph9RAc6PeLZucGuPyF2rwSIyW5KAB2\nA/WYlO+3QNlvT0VRo41k2g==\n-----END PRIVATE KEY-----\n",
      messagingSenderId: '362191410883',
      projectId: 'kasabike-8f6a4', 
      appId: 'com.example.kasabike',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({@required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Redirect to chat page',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: _openPage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _openPage() {
    navigatorPush(
      context: context,
      name: 'Login',
      widget: Login(),
    );
  }
}
