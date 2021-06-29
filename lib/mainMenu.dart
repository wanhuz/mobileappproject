import 'package:flutter/material.dart';
import 'placeCard.dart';
import 'package:http/http.dart' as http;
import 'package:madgpproject/authentication_service.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacation in Malaysia',
      theme: ThemeData( primarySwatch: Colors.blue, ),
      home: MainMenuPage(title: 'Vacation In Malaysia'),
    );
  }
}

class MainMenuPage extends StatefulWidget {
  MainMenuPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainMenuPage createState() => _MainMenuPage();
}

class _MainMenuPage extends State<MainMenuPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton( //Button to log out
                              backgroundColor: Colors.blue,
                              onPressed: (){context.read<AuthenticationService>().signOut();}, 
                              child: Icon(Icons.logout),
                              ),
      body: Center(
        child: FutureBuilder<List<PlaceCard>>(
          future: fetchPlace(http.Client()),
          builder: (context, snapshot) {
            List<Widget> children;

            if (snapshot.hasData) {
              var vacationPlaces = snapshot.data;

              children = <Widget> [ 
                for (int i = 0; i < vacationPlaces.length; i++) 
                  vacationPlaces.elementAt(i),  
                ];

            }
            else if (snapshot.hasError) {
              return Text("Error: " + snapshot.error);
            }
            else {
              children = <Widget> [ LinearProgressIndicator() ];
            }

            return Center(
              child: ListView(
                children: children,
              )
            );
          }
        )
      ),
    );
  }
}
