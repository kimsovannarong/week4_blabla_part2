

import 'package:week4_blabla/model/ride/locations.dart';
import 'package:week4_blabla/repository/locations_repository.dart';

import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static LocationsService? _instance;
  // Access to past preferences
  final LocationsRepository repository;
  LocationsService._internal(this.repository);

  // static const List<Location> availableLocations = fakeLocations; 
  List<Location> get availableLocations => repository.getLocations();

  //initialize 
  static void initialize(LocationsRepository repo){
    if(_instance == null){
      _instance = LocationsService._internal(repo);
    }else{
      throw Exception("LocatonService is already initialized.");
    }
  }
  // singleton accessor
  static LocationsService get instance {
    if (_instance == null) {
		  throw Exception("RidePreferencesService is not initialized. Call initialize() first.");
		}
		return _instance!;
  }

}