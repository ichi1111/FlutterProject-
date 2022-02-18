import 'package:flutter/material.dart';

class Backpack {
  String location;
  String name;
  String img;
  String img2;

  Backpack(
    this.location,
    this.name,
    this.img,
    this.img2,
  );
  static Backpack pub = Backpack(
    'Salaya, Nakhon Pathom',
    'AboutUs',
    'images/search.jpg',
    'images/aboutus.jpg',
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Route Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/search': (context) => const SecondScreen(),
        '/Aboutus': (context) => const ThirdScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: const Text('Hang Out'),
        backgroundColor: Color.fromARGB(255, 245, 157, 24),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Welcome to Hang Out',
            style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(
              image: AssetImage(Backpack.pub.img),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Let find pub/bar to Hang Out",
            style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: 400,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search', arguments: Backpack.pub);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 245, 157, 24)),
            ),
            child: const Text('Find a Pub/bar'),
          ),
        ],
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String data;
  const SecondScreen({
    Key? key,
    @required this.data = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Backpack;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Color.fromARGB(255, 245, 157, 24),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            data.name,
            style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(
              image: AssetImage(data.img2),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            data.location,
            style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ThirdScreen()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 245, 157, 24)),
            ),
            child: const Text("Back"),
          ),
        ],
      )),
    );
  }
}

class ThirdScreen extends StatelessWidget{
  final String data;
  const ThirdScreen({
    Key? key,
    @required this.data = '',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: const Text('Hang Out'),
        backgroundColor: Color.fromARGB(255, 245, 157, 24),
      )
    );
  }
}
