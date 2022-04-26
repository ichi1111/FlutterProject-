import 'package:flutter/material.dart';
import 'package:hangout/pub.dart';
import 'package:hangout/pubpage.dart';

import 'auth_controller.dart';

class WelcomePage extends StatefulWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<Pub> pubs = allPub;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List<Pub> textpub = allPub;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/signup.png"), fit: BoxFit.cover)),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.1,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    backgroundImage: AssetImage("img/profile1.png"),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                    ])),
            SizedBox(
              height: 10,
            ),
            Container(
                width: w,
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    Text(
                      "DRINKER ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search Pub/bar",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white))),
                  onChanged: searchPub,
                )),
            Expanded(
                child: ListView.builder(
                    itemCount: pubs.length,
                    itemBuilder: (context, index) {
                      final pub = pubs[index];

                      return ListTile(
                          leading: Image.network(
                            pub.urlImage,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                          ),
                          title: Text(pub.title),
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PubPage(pub: pub),
                                ),
                              ));
                    })),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  AuthController.instance.logOut();
                },
                child: Container(
                    width: w * 0.5,
                    height: h * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage("img/loginbtn.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      "Log out",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )))),
          ],
        ));
  }

  void searchPub(String query) {
    final suggestions = allPub.where((pub) {
      final pubTitle = pub.title.toLowerCase();
      final input = query.toLowerCase();

      return pubTitle.contains(input);
    }).toList();

    setState(() => pubs = suggestions);
  }
}
