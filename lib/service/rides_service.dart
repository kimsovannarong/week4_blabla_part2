import 'package:week4_blabla/model/ride_pref/ride_pref.dart';
import 'package:week4_blabla/repository/ride_preferences_repository.dart';
import 'package:week4_blabla/repository/rides_repository.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {

  static RidesService? _instance;
  final RidesRepository repository;

  // static List<Ride> availableRides = fakeRides;  

  ///
  /// Private constructor
  ///
  RidesService._internal(this.repository);

   // singleton accessor
  static RidesService get instance {
    if (_instance == null) {
      throw Exception("RidesService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  ///
  /// Initialize
  ///
  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("RidesService is already initialized.");
    }
  }

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  static List<Ride> getRidesFor(RidePreference preferences, RidesFilter? filter) {
    return RidesService.instance.repository.getRides(preferences, filter);
  }
}


// class RideFilter
class RidesFilter {
  final bool acceptPets;
  RidesFilter({required this.acceptPets});
}