import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scopedmodel/Model/donationModel.dart';

class DonationModelScreen extends StatefulWidget {
  @override
  _DonationModelScreenState createState() => _DonationModelScreenState();
}

class _DonationModelScreenState extends State<DonationModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://images.unsplash.com/photo-1544568104-5b7eb8189dd4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
        ),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              shadowColor: Color(0x802196F3),
              child: ScopedModelDescendant<DonationModel>(
                  builder: (context, child, model) {
                if (model.donateClicked) {
                  return _buildContent(model);
                } else {
                  return _buildInitContent(model);
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInitContent(DonationModel model) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 300.0,
          child: Column(
            children: <Widget>[
              _titleContainer(),
              _priceContainer(model),
              _donateContainer(model),
            ],
          ),
        ));
  }

  Widget _titleContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'LEO',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Dogs are Loyal',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red, fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _priceContainer(DonationModel model) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              model.decrement();
            },
            child: Icon(
              Icons.remove,
              color: Colors.redAccent,
              size: 30.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
          ),
          Text(
            '\u0024 ${model.count}',
            style: TextStyle(fontSize: 44.0, color: Colors.black),
          ),
          RawMaterialButton(
            onPressed: () {
              model.increrment();
            },
            child: Icon(
              Icons.add,
              color: Colors.redAccent,
              size: 30.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }

  Widget _donateContainer(DonationModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              model.donateClicked = true;
            },
            textColor: Colors.white,
            color: Colors.orange,
            child: Text(
              'Donate',
              style: TextStyle(fontSize: 24.0),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300.0,
        child: Column(
          children: <Widget>[
            _thankYouText(model),
            _backButton(model),
          ],
        ),
      ),
    );
  }

  Widget _thankYouText(DonationModel model) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.home,
            color: Colors.blue,
            size: 40.0,
          ),
          Text(
            "LEO says",
            style: TextStyle(fontSize: 25.0, color: Colors.black),
          ),
          SizedBox(height: 10.0),
          Text(
            'Thank You for Donating \u0024 ${model.count}',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xffdd6d3d),
            ),
          )
        ],
      ),
    );
  }

  Widget _backButton(DonationModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              model.donateClicked = false;
            },
            textColor: Colors.white,
            color: Colors.orange,
            child: Text(
              'Go Back',
              style: TextStyle(fontSize: 24.0),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ],
      ),
    );
  }
}
