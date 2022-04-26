import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangout/map.dart';
import 'package:hangout/pub.dart';

class PubPage extends StatefulWidget {
  final Pub pub;

  const PubPage({Key? key, required this.pub}) : super(key: key);

  @override
  State<PubPage> createState() => _PubPageState();
}

class _PubPageState extends State<PubPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(widget.pub.title),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: Column(children: [
        Image.network(
          widget.pub.urlImage,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Text(
            widget.pub.about,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: Text(
            widget.pub.time,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            "Contact: " + widget.pub.tel,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          child: const Text('Map'),
          onPressed: () {
            // Navigator.pushReplacementNamed(context, '/map');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Builder(builder: (context) {
                        return MapScreen(widget.pub);
                      })),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
        ),
      ]));
}
