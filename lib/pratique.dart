// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _animals = ["Dog", "Cat", "Crocodile", "Dragon"];

  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30)),
          child: DropdownButton<String>(
            onChanged: (value) {
              setState(() {
                _selectedColor = value;
              });
            },
            value: _selectedColor,

            // Hide the default underline
            underline: Container(),
            hint: Center(
                child: Text(
              'Select the aniaml you love',
              style: TextStyle(color: Colors.white),
            )),
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.yellow,
            ),
            isExpanded: true,

            // The list of options
            items: _animals
                .map((e) => DropdownMenuItem(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      value: e,
                    ))
                .toList(),

            // Customize the selected item
            selectedItemBuilder: (BuildContext context) => _animals
                .map((e) => Center(
                      child: Text(
                        e,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.amber,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
