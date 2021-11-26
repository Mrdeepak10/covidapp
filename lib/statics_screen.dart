import 'package:flutter/material.dart';

import 'api_services.dart';

class StaticsScreen extends StatefulWidget {
  const StaticsScreen({Key? key}) : super(key: key);

  @override
  _StaticsScreenState createState() => _StaticsScreenState();
}

class _StaticsScreenState extends State<StaticsScreen> {
  final APICalling _apiCalling = APICalling();

  dynamic defaultData;

  //
  void callDefault() async {
    var response = await _apiCalling.getDefault();

    setState(() {
      defaultData = response;
    });
    print(response['countriesRoute']);

    // response.then((value) => print("Res : ${value['countriesRoute']}"));
  }

  @override
  void initState() {
    callDefault();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: defaultData != null
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                      title: Text("${defaultData['countriesRoute']['Name']}"),
                      subtitle: Text("${defaultData['countriesRoute']['Description']}"),
                      trailing: Text("${defaultData['countriesRoute']['Path']}"),
                    )
                  // Text("${defaultData['countriesRoute']['Name']}"),

                );
              })
          :  const Center(
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            ),
    );
  }
}
