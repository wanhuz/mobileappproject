import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'show.dart';

Future<Airline> fetchAirline(int id) async {
  final response =
      await http.get(Uri.parse('https://raw.githubusercontent.com/wanhuz/mobileappP2/master/vacplace.json'));

  if (response.statusCode == 200) {
      return Airline.fromJson(jsonDecode(response.body)[id]); //Return one data of Json with specific id
  } else {
      throw Exception('Failed to load Airline Data');
  }
}

class Airline {
  final int id;
  final String logo;
  final String name;
  final String slogan;
  final String hq;

  Airline({
    this.id,
    this.logo,
    this.name,
    this.slogan,
    this.hq,
  });

  factory Airline.fromJson(Map<String, dynamic> json) {
    return Airline(
      id: json['id'],
      logo: json['img'],
      name: json['place'],
      slogan: json['place'],
      hq: json['desc'],
    );
  }
}

class ShowData extends StatefulWidget {
  final int id;
  ShowData(this.id);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  Future<Airline> futureAirline;

  @override
  void initState() {
    super.initState();
    futureAirline = fetchAirline(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Airline',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vacation In Malaysia'),
        ),
        body: FutureBuilder<Airline>(
              future: futureAirline,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Show(snapshot.data.logo, snapshot.data.name, snapshot.data.slogan, snapshot.data.hq);

                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");

                }

                return LinearProgressIndicator();
              },
            ),
      ),
    );
  }
}