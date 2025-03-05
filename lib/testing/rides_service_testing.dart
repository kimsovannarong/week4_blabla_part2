
import 'package:week4_blabla/model/ride/locations.dart';
import 'package:week4_blabla/model/ride_pref/ride_pref.dart';
import 'package:week4_blabla/repository/mock/mock_ride_repository.dart';
import 'package:week4_blabla/service/rides_service.dart';
import 'package:week4_blabla/model/ride/ride.dart';

void main() {
  // Initialize the service with Mock Repository
  RidesService.initialize(MockRideRepository());
  RidesFilter nofilter = RidesFilter(acceptPets: false);
  RidesFilter filter = RidesFilter(acceptPets: true);
  displayRide('T1: Display rides without pet filter', Location(name: 'Battambang', country: Country.cambodia), Location(name: 'Siem Reap', country: Country.cambodia), nofilter);
  displayRide('T2: Display rides with pet filter', Location(name: 'Battambang', country: Country.cambodia), Location(name: 'Siem Reap', country: Country.cambodia),filter);
}
void displayRide(String title,Location departure,Location arrival,RidesFilter filter){
  bool isFull=false;
  int full_ride_count=0;
  print(title);
  RidePreference preference = RidePreference(
    departure: departure,
    arrival: arrival,
    departureDate: DateTime.now(),
    requestedSeats: 1,
  );
  List<Ride> rides =RidesService.instance.getRidesFor(preference, filter, null);
  print('For your preference (${preference.departure.name} -> ${preference.arrival.name}, today ${preference.requestedSeats} passenger) we found ${rides.length} rides:');
  for (var availableRides in rides){
   print('- from ${availableRides.departureLocation.name} to ${availableRides.arrivalLocation.name} with ${availableRides.driver.firstName}');
   if(availableRides.availableSeats==0){
    isFull=true;
    full_ride_count++;
   }
  }
  if(isFull){
    print("Warning: $full_ride_count ride is full!");
  }
}
