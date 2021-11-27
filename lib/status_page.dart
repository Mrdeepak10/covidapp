import 'package:flutter/cupertino.dart';
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

  void callByStatus(status) async {
    var response =
        await _apiCalling.getCountryByStatusData(widget.country, status);

    setState(() {
      countryData = response;
    });

    // response.then((value) => print("Res : ${value['countriesRoute']}"));
  }

  @override
  void initState() {
    callByStatus("confirmed");
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
                      const Padding(padding: EdgeInsets.all(8)),
                      Center(child: Text(countryData![index]["Country"])),
                      Center(child: Text(countryData![index]["Date"])),
                      Center(child: Text(countryData![index]["Status"].toString())),
                    ],
                  )
                      // Text("${defaultData['countriesRoute']['Name']}"),
                      );
                })
            : const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.list),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: const Text('Confirmed'),
                        onTap: () {
                          Navigator.pop(context);
                          callByStatus('confirmed');
                        },
                      ),
                      ListTile(
                        title: const Text('Deaths'),
                        onTap: () {
                          Navigator.pop(context);
                          callByStatus('deaths');
                        },
                      ),
                      ListTile(
                        title: const Text('Recovered'),
                        onTap: () {
                          Navigator.pop(context);
                          callByStatus('recovered');
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}


