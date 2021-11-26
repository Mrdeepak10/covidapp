import 'package:covid_app/status_page.dart';
import 'package:covid_app/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_services.dart';

class ProtectionScreen extends StatefulWidget {
  const ProtectionScreen({Key? key}) : super(key: key);

  @override
  _ProtectionScreenState createState() => _ProtectionScreenState();
}

class _ProtectionScreenState extends State<ProtectionScreen> {
  final APICalling _apiCalling = APICalling();

  List? countries;

  //
  void callDefault() async {
    var response = await _apiCalling.getCountries();

    setState(() {
      countries = response;
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
      body: countries != null
          ? ListView.builder(
              itemCount: countries!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: GestureDetector(
                        onTap: () {
                          AppRoutes.push(
                              context,
                              StatusPage(
                                  country: countries![index]["Country"]));
                        },
                        child: Text("${countries![index]["Country"]}")),
                    subtitle: Container(
                      height: 50,
                      width: 250,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            IconButton(
                                onPressed: () {
                                  print("Hello");
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.teal,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.teal,
                                )),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.arrow_back)),
                          ]),
                    ),
                    isThreeLine: true,
                  ),
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
