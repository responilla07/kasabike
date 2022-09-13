import 'package:flutter/material.dart';

class FriendsDetails extends StatefulWidget {
  // const FriendsDetails({super.key});

  @override
  State<FriendsDetails> createState() => _FriendsDetailsState();
}

class _FriendsDetailsState extends State<FriendsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          SizedBox(
            height: 24,
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset('images/man.jpg').image),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("+631234567"),
                            Text(
                              "Brgy. Batong Bukal Purok 3",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone_android_outlined,
                              size: 24,
                            )),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.message, size: 24),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(children: [
                Text(
                  "Average rating",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 56,
                    ),
                    Icon(
                      Icons.star,
                      size: 56,
                    ),
                    Icon(
                      Icons.star,
                      size: 56,
                    ),
                    Icon(
                      Icons.star,
                      size: 56,
                    ),
                    Icon(
                      Icons.star,
                      size: 56,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(),
                SizedBox(
                  height: 16,
                ),
                Text("Latest rider reviews"),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
