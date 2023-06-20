import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerStream extends StatelessWidget {
  const DrawerStream({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          backgroundColor: Colors.white,
          child: ListView(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Row(
                  children: [
                    const SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/bg.png"))),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("othman lamudate \nothmanlamudate@gmail.com",
                            style: TextStyle(color: Colors.black)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(
                        Icons.view_list_rounded,
                        color: Colors.black,
                        size: 25,
                      ),
                      title: Text("Home",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person_4,
                        color: Colors.black,
                        size: 25,
                      ),
                      title: Text("Profile",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.save_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                      title: Text("Saved",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: 25,
                      ),
                      title: Text("Setting",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ],
                ))
          ])),
    );
  }
}
