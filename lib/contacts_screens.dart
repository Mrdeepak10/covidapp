import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_services.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final APICalling _apiCalling = APICalling();

  List? countryData;

  //
  void callDefault() async {
    var response = await _apiCalling.getCountryData(country: '');
    print("response:$response");
    setState(() {
      countryData = response;
    });

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
      body: countryData != null
          ? ListView.builder(
              itemCount: countryData!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(countryData![index]["Country"]),
                    Text(countryData![index]["CountryCode"]),
                    Text(countryData![index]["Cases"].toString()),
                  ],
                )
                    // Text("${defaultData['countriesRoute']['Name']}"),
                    );
              })
          : const Center(
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            ),
    );
  }
}
