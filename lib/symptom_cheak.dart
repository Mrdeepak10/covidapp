import 'package:covid_app/utils.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SymptomPage extends StatefulWidget {
  const SymptomPage({Key? key}) : super(key: key);

  @override
  _SymptomPageState createState() => _SymptomPageState();
}

class _SymptomPageState extends State<SymptomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Utility.appColor,
      appBar: AppBar(
        leading: GestureDetector(onTap: () {
           Navigator.pop(context, const HomePage(), );
        },

            child: const Icon(Icons.arrow_back)),
        backgroundColor: Utility.appColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20),
            child: Stack(
              children:  const [
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
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Text(
                "Symptom Cheak",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 08.0,
                    width: 270,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 08.0,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          '1/3',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  ]),

                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(children: const [
                            Text(
                              'Cheak all symptoms you have',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: const [
                            Text('experienced in the past 2',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: const [
                            Text('weeks :',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Utility.appColor,
                                  ),
                                  height: 50,
                                  width: 75,
                                  child: const Center(
                                      child: Text(
                                    "Fever",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ))),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffD4ECEF),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      height: 50,
                                      child:  Center(
                                          child: Text("Shortness of breath",style: TextStyle(color: Utility.appColor,
                                          ),)))),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffD4ECEF),
                                  ),
                                  height: 50,
                                  width: 130,
                                  child:  Center(
                                      child: Text(
                                    "Dry cough",
                                    style: TextStyle(
                                      color: Utility.appColor,
                                    ),
                                  ))),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffD4ECEF),
                                  ),
                                  height: 50,
                                  width: 100,
                                  child:  Center(
                                      child: Text(
                                    "Fatigue",
                                    style: TextStyle(
                                      color: Utility.appColor,
                                    ),
                                  ))),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Utility.appColor,
                              ),
                              height: 50,
                              width: 140,
                              child: const Center(
                                  child: Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ))),
                        ],
                      ),
                    ),
                  )

            ],
          )
        ],
      ),
    );
  }
}
