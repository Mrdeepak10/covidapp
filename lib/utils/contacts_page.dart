import 'package:covid_app/api_services.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final APICalling _apiCalling = APICalling();
  List? getStatus;

  void callDefault(country) async {
    var response = await _apiCalling.getStatus(country);
    setState(() {
      getStatus = response;
    });
  }

  @override
  void initState() {
    callDefault("india");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getStatus != null
          ? ListView.builder(
              itemCount: getStatus!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getStatus![index]["Country"]),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(getStatus![index]["Confirmed"].toString()),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(getStatus![index]["Active"].toString()),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(getStatus![index]["Date"]),
                  ],
                ));
              },
            )
          : const Center(
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            ),
    );
  }
}
