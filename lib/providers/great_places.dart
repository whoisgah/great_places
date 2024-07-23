import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

class GreatPLaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index){
    return _items[index];
  }

  
}