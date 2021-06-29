import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'showData.dart';


//Return a card to show one vacation place
class PlaceCard extends StatelessWidget {
   final String imgUrl;
   final String place;
   final String desc;
   final int id;

  PlaceCard(
    this.id,
    this.imgUrl,
    this.place,
    this.desc,
  );

  @override
  Widget build(BuildContext context) {

      return ListTile(
        leading:  SizedBox(height: 100, width: 100, child:  Image.network(imgUrl, height:300, width: 200, fit: BoxFit.fill,)),
        title:    Text(place),
        subtitle: Text(desc + "\n"),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowData(id)));}
      );
  }

  factory PlaceCard.fromJson(Map<String, dynamic> json) {
    return PlaceCard(
      json['id'] as int,
      json['img'] as String,
      json['place'] as String,
      json['desc'] as String
    );
  }
}


Future<List<PlaceCard>> fetchPlace(http.Client client) async {
    final response = await client.get(
      Uri.parse('https://raw.githubusercontent.com/wanhuz/mobileappP2/master/vacplace.json'));

    if (response.statusCode == 200) {
      return compute(parsePlace, response.body);
    } 
    else {
      throw Exception('Failed to load Place');
    }
}

//Fetch all the data into a list of PlaceCard Widget
List<PlaceCard> parsePlace(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<PlaceCard>((json) => PlaceCard.fromJson(json)).toList();
}