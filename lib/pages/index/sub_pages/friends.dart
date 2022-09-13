import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kasabike/pages/index/sub_pages/friends_details.dart';
import 'package:kasabike/pages/index/sub_pages/home.dart';
import 'package:kasabike/widgets/custom_field.dart';

class Friends extends StatefulWidget {
  // const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        SizedBox(
          height: 32,
        ),
        CustomTextField(
          hintText: "Find friends",
          borderRadius: 8,
          suffixIcon: Icon(Icons.search),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _FriendsCard(),
              _FriendsCard(),
              _FriendsCard(),
              _FriendsCard(),
              _FriendsCard(),
              _FriendsCard(),
              _FriendsCard(),
            ],
          ),
        ),
      ]),
    );
  }
}

//Friends card template
class _FriendsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FriendsDetails(),
            ));
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('images/man.jpg').image))),
              SizedBox(
                height: 12,
              ),
              Text(
                "John Doe",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text("Calamba")
            ],
          ),
        ),
      ),
    );
  }
}
