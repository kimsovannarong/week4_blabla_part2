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

   // singleton accessor
  static RidesService get instance {
    if (_instance == null) {
      throw Exception("RidesService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }


 
  // Bla 103- success 
   List<Ride> getRidesFor(RidePreference preferences, RidesFilter? filter,RideSortType? sortType) {
   List<Ride> matchingRides = repository
        .getRides(preferences, filter)
        .where((ride) =>
            ride.departureLocation == preferences.departure &&
            ride.arrivalLocation == preferences.arrival &&
            (filter == null || ride.acceptPets.acceptPets == filter.acceptPets))
        .toList();

    // handle sorting type if it's provided
    if (sortType != null) {
      switch (sortType) {
        case RideSortType.earliestDeparture:
          matchingRides.sort((a, b) => a.departureDate.compareTo(b.departureDate));
          break;
        case RideSortType.lowestPrice:
          matchingRides.sort((a, b) => a.pricePerSeat.compareTo(b.pricePerSeat));
          break;
      }
    }

    return matchingRides;
  }
}


// class RideFilter
class RidesFilter {
  final bool acceptPets;
  RidesFilter({required this.acceptPets});
}
enum RideSortType{
  earliestDeparture,
  lowestPrice
}