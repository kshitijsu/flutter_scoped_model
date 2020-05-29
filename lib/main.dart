import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scopedmodel/Model/donationModel.dart';
import 'donationModelScreen.dart';

void main() {
  runApp(MyApp());
}

DonationModel donationModel = DonationModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: donationModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Scoped_Model Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DonationModelScreen(),
      ),
    );
  }
}
