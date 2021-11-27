import 'package:covid_app/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadDataPage extends StatefulWidget {
  const UploadDataPage({Key? key}) : super(key: key);

  @override
  _UploadDataPageState createState() => _UploadDataPageState();
}

class _UploadDataPageState extends State<UploadDataPage> {
  final APICalling _apiCalling = APICalling();

  List countriesData = [];

  void callDefault() async {
    var response = await _apiCalling.getAllStatus();
    dynamic tmp;
    tmp = response;
    setState(() {
      countriesData = tmp["Countries"];
    });
  }

  @override
  void initState() {
    callDefault();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("DataPage"),
        ),
        body: ListView.builder(
          itemCount: countriesData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Country  - " +
                            countriesData[index]['Country'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "CountryCode  - " +
                            countriesData[index]['CountryCode'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),

                      ),
                      Text(
                        "NewConfirmed  - " +
                            countriesData[index]['NewConfirmed'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "TotalConfirmed   - " +
                            countriesData[index]['TotalConfirmed'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "TotalDeaths  -  " +
                            countriesData[index]['TotalDeaths'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
