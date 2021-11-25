import 'package:flutter/material.dart';

class RiskInfectionPage extends StatefulWidget {
  const RiskInfectionPage({Key? key}) : super(key: key);

  @override
  _RiskInfectionPageState createState() => _RiskInfectionPageState();
}

class _RiskInfectionPageState extends State<RiskInfectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Risk of infection",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.update,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              children: [
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                    child: Image.asset(
                      "images/shield.png",
                      height: 50,
                    )),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  children: const [
                    Text(
                      "The app ",
                    ),
                    Text(
                      " has not found ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("any"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Text("potentially dangerous contacts"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: const [
                    Text("in the last 14 days."),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Text(
                  'Learn What To Do Next',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
                height: 100,
                width: 265,
                color: Colors.transparent,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("COVID-19: Keeping Safe During \n the Pandemic"),
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                height: 100,
                width: 265,
                color: Colors.transparent,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "Three Ways You Can Help During \n the COVID-19 Pandemic"),
                )),
          ),
        ],
      ),
    );
  }
}
