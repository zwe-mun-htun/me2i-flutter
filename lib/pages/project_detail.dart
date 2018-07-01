import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class ProjectDetailPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    String title = "Amazing Delivery";
    String img_url ="https://accelerator.phandeeyar.org/assets/img/startups/cohort2/amazing_express/logo.png" ;
    String desc = "Amazing Express is a last mile delivery platform between online/retail shop owners & part time delivery people called Amazing Lulins who want to extra money.";
    return new Scaffold(
      appBar: AppBar(
        title: new Text(title),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                  Icons.favorite,
                  color: Colors.white),
              onPressed: null),
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Image.network(img_url, height: 200.0,),
            new Padding(padding: new EdgeInsets.all(8.0),
              child: new Text(title,
                style: new TextStyle(fontSize: 20.0, fontFamily: 'Oxygen'),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new Text(desc, style: new TextStyle(fontFamily: 'Oxygen'),),
            ),

            new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Card(
                child: new Row(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.all(5.0),
                          width: 100.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://accelerator.phandeeyar.org/assets/img/startups/cohort2/amazing_express/Cho_CEO.png")
                            ),
                          ),
                        ),
                        new Text("Cho Nwe Zin"),
                        new Text("CEO"),
                        new Icon(Icons.mail),
                      ],
                    ),

                    new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.all(5.0),
                          width: 100.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://accelerator.phandeeyar.org/assets/img/startups/cohort2/amazing_express/Aung_CSO.png")
                            ),
                          ),
                        ),
                        new Text("Aung Pyae Phyo"),
                        new Text("CSO"),
                        new Icon(Icons.mail),
                      ],
                    ),

                    new Column(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.all(5.0),
                          width: 100.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://accelerator.phandeeyar.org/assets/img/startups/cohort2/amazing_express/khinelin.jpg")
                            ),
                          ),
                        ),
                        new Text("Cho Nwe Zin"),
                        new Text("CTO"),
                        new Icon(Icons.mail),
                      ],
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }


}
