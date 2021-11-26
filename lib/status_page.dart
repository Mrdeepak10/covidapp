import 'package:flutter/material.dart';

import 'api_services.dart';

class StatusPage extends StatefulWidget {
  final String country;

  const StatusPage({Key? key, required this.country}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final APICalling _apiCalling = APICalling();

  List? countryData;

  //
  void callDefault() async {
    var response = await _apiCalling.getCountryData(country: widget.country);

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Status of Country"),
        ),
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
      ),
    );
  }
}
