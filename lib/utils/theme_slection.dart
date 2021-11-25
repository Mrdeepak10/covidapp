import 'package:flutter/material.dart';

import 'app_constants.dart';
import 'app_preferences.dart';

class SelectTheme extends StatefulWidget {
  @override
  _SelectThemeState createState() => _SelectThemeState();
}

class _SelectThemeState extends State<SelectTheme> {
  late int selectedColorIndex;
  final List<Color> _tiles = [
    AppConstants.zeroIndexColor,
    AppConstants.firstIndexColor,
    AppConstants.secondIndexColor,
    AppConstants.thirdIndexColor,
    AppConstants.fourthIndexColor,
    AppConstants.fifthIndexColor,
    AppConstants.sixthIndexColor,
    AppConstants.seventhIndexColor,
    AppConstants.eighthIndexColor,
    AppConstants.nineIndexColor,
    AppConstants.tenIndexColor,
    AppConstants.elevenIndexColor,
    AppConstants.twelveIndexColor,
    AppConstants.thirteenIndexColor,
    AppConstants.fourteenIndexColor,
    AppConstants.fifteenIndexColor,
    AppConstants.sixteenIndexColor,
    AppConstants.seventeenIndexColor,
    AppConstants.eighteenIndexColor,
    AppConstants.nineteenIndexColor,
    AppConstants.twentyIndexColor,
    AppConstants.twentyOneIndexColor,
    AppConstants.twentyTwoIndexColor,
    AppConstants.twentyThreeIndexColor,
    AppConstants.twentyFourIndexColor,
    AppConstants.twentyFiveIndexColor,
    AppConstants.twentySixIndexColor,
    AppConstants.twentySevenIndexColor,
    AppConstants.twentyEightIndexColor,
    AppConstants.twentyNineIndexColor,
    AppConstants.thirtyIndexColor
  ];

  void _selectedColor({required int index}) {
    setState(() {
      selectedColorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'theme',
      child: Scaffold(
        backgroundColor: selectedColorIndex != null
            ? _tiles[selectedColorIndex]
            : Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: ListView(
            children: [
              gridView(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [_saveButton(), _cancelButton()],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _saveButton() {
    return Container(
      height: 40,
      width: 80,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              AppConstants.colorPrimary = _tiles[selectedColorIndex];
              AppSharedPreference.setTheme(selectedColorIndex);
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            });
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppConstants.colorPrimary),
              minimumSize: MaterialStateProperty.all(Size(30, 50))),
          child: Text('Save')),
    );
  }

  Widget _cancelButton() {
    return Container(
      height: 40,
      width: 80,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              minimumSize: MaterialStateProperty.all(Size(30, 50))),
          child: Text('Cancel')),
    );
  }

  Widget gridView() {
    return Container(
      height: 650,
      margin: EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: _tiles.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, mainAxisSpacing: 18),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                _selectedColor(index: index);
              },
              child: Card(
                elevation: 6,
                color: _tiles[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
