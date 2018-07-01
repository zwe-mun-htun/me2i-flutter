import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:me2i/pages/project_detail.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{

  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> projectsList;

  final CollectionReference collectionReference = Firestore.instance.collection("projects");


  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot){
      setState(() {
        projectsList = datasnapshot.documents;
      });
    });
  }


  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void comingSoon() {
    var alert = new AlertDialog(
      title: new Text("Sorry"),
      content: new Text("Comming soon"),
    );
    showDialog(context: context, child: alert);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(

          title: new Text("Me2i"),

          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                    Icons.search,
                    color: Colors.white),
                onPressed: comingSoon),
          ],
        ),
        body: projectsList != null
            ? new StaggeredGridView.countBuilder(
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 4,
          itemCount: projectsList.length,
          itemBuilder: (context, i) {
            String imgPath = projectsList[i].data['url'];
            String doc_id = projectsList[i].documentID;
            return new Material(
              elevation: 8.0,
              borderRadius:
              new BorderRadius.all(new Radius.circular(8.0)),
              child: new InkWell(
                onTap: ()=>Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ProjectDetailPage())),
                child: new Hero(
                  tag: imgPath,
                  child: new Container(
                      constraints: new BoxConstraints.expand(
                        height: 200.0,
                      ),
                      padding: new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage(imgPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (i) =>
          new StaggeredTile.count(2, i.isEven ? 2 : 3),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ) : new Center(
          child: new CircularProgressIndicator(),
        ),
      floatingActionButton: new FloatingActionButton(
      onPressed: comingSoon,
      child: new Icon(
          Icons.add),
    ),
    );

  }
}