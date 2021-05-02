import 'package:flutter/material.dart';
import 'package:milestone1/data/locationsAll.dart';
import 'package:milestone1/DetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Milestone 1',
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: new MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  final String title;
  MainScreen({Key key, this.title}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('favLocations')),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                location: locationsAll().listObjects[index])));
                  },
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                            locationsAll().listObjects[index].imageUrl),
                      ),
                      ListTile(
                        title: Text(locationsAll().listObjects[index].name,
                            textAlign: TextAlign.center),
                        subtitle: Text(locationsAll().listObjects[index].theme,
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
