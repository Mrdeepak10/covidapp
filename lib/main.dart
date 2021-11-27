import 'package:covid_app/protection_screen.dart';
import 'package:covid_app/risk_infection.dart';
import 'package:covid_app/symptom_cheak.dart';
import 'package:covid_app/upload_data.dart';
import 'package:covid_app/utils/contacts_page.dart';
import 'package:covid_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'map.dart';
import 'statics_screen.dart';
import 'utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utility.appColor,
      drawer: const Drawer(),
      appBar: appbarWidget(),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          virusTextWidget(),
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  symptomWidget(),
                  mapRiskUploadWidget(),
                  rowOfMapRiskDataWidget(),
                  staticsProtectionContactsWidget(),
                  rowOfStaticsProtectionContactsWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget virusTextWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 100,
        ),
        child: Row(
          children: [
            const Image(
              image: AssetImage(
                "images/coronavirus.png",
              ),
              height: 100,
            ),
            const SizedBox(
              width: 50,
            ),
            Column(
              children: const [
                Text(
                  "6738",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Total Cases",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget symptomWidget() {
    return Row(
      children: [
        Card(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SymptomPage()));
            },
            child: Container(
              height: 100,
              width: 295,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [Image.asset("images/nurse.png")],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Symptom \nChecker",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("Based on common \nsymptoms"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget mapRiskUploadWidget() {
    return Row(
      children: [
        Card(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MapSample()));
            },
            child: Container(
              child: Image.asset("images/img_3.png", fit: BoxFit.fill),
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        Card(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RiskInfectionPage()));
            },
            child: Container(
              child: Image.asset(
                "images/img_9.png",
                fit: BoxFit.fill,
              ),
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
        Card(
          child: GestureDetector(onTap: () {
            AppRoutes.push(context,  const UploadDataPage());
          },
            child: Container(
              child: Image.asset("images/img_5.png", fit: BoxFit.fill),
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ),
      ],
    );
  }

  Widget rowOfMapRiskDataWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Map"),
          Text("Risk of \n infection"),
          Text("Upload Data"),
        ],
      ),
    );
  }

  Widget staticsProtectionContactsWidget() {
    return GestureDetector(
      onTap: () {
        AppRoutes.push(context, const StaticsScreen());
      },
      child: Row(
        children: [
          Card(
            child: Container(
              child: Image.asset("images/img_6.png", fit: BoxFit.fill),
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          GestureDetector(onTap: () {
            AppRoutes.push(context, const ProtectionScreen());
          },
            child: Row(
              children: [
                Card(
                  child: Container(
                    child: Image.asset("images/img_7.png", fit: BoxFit.fill),
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(onTap: () {
            AppRoutes.push(context, const ContactPage());
          },
            child: Card(
              child: Container(
                child: Image.asset("images/img_8.png", fit: BoxFit.fill),
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowOfStaticsProtectionContactsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Statistics"),
          Text("Protection"),
          Text("Contacts"),
        ],
      ),
    );
  }

  AppBar appbarWidget() {
    return AppBar(
      backgroundColor: Utility.appColor,
      elevation: 0,
      title: Row(
        children: const [
          Text("Indore, India"),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20),
          child: Stack(
            children: const [
              Icon(Icons.notifications_none),
              Positioned(
                  right: 0,
                  top: -1,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 5,
                    child: Text(
                      "2",
                      style: TextStyle(fontSize: 8),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
