import 'package:covid_app/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadDataPage extends StatefulWidget {


  const UploadDataPage ({Key? key}) : super(key: key);

  @override
  _UploadDataPageState createState() => _UploadDataPageState();
}

class _UploadDataPageState extends State<UploadDataPage> {
  final APICalling _apiCalling = APICalling();

  List? allStatus;

  void callDefault() async {
    var response = await _apiCalling.getAllStatus();

    setState(() {
      allStatus = response;
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
        body: allStatus != null
            ? ListView.builder(
                itemCount: allStatus!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Country  - " + allStatus![index]['Country'],style: const TextStyle(fontWeight: FontWeight.bold),),
                            Text("CountryCode  - "+allStatus![index]['CountryCode'],style: const TextStyle(fontWeight: FontWeight.bold),),
                            Text("NewConfirmed  - "+allStatus![index]['NewConfirmed'].toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                            Text("TotalConfirmed   - "+allStatus![index]['TotalConfirmed'].toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                            Text("TotalDeaths  -  "+allStatus![index]['TotalDeaths'].toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            : const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              ),
      ),
    );
  }
}
