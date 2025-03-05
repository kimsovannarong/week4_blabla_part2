import 'package:week4_blabla/model/ride/locations.dart';
import 'package:week4_blabla/model/ride/ride.dart';
import 'package:week4_blabla/model/ride_pref/ride_pref.dart';
import 'package:week4_blabla/model/user/user.dart';
import 'package:week4_blabla/repository/rides_repository.dart';
import 'package:week4_blabla/service/rides_service.dart';

class MockRideRepository extends RidesRepository {
  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    // Mock users
    User kannika = User(
      firstName: "Kannika",
      lastName: "Sok",
      email: "kannika@example.com",
      phone: "+85512345678",
      profilePicture: "https://example.com/profiles/kannika.jpg",
      verifiedProfile: true,
    );

    User chaylim = User(
      firstName: "Chaylim",
      lastName: "Cheng",
      email: "chaylim@example.com",
      phone: "+85587654321",
      profilePicture: "https://example.com/profiles/chaylim.jpg",
      verifiedProfile: true,
    );

    User mengtech = User(
      firstName: "Mengtech",
      lastName: "Hem",
      email: "mengtech@example.com",
      phone: "+85599887766",
      profilePicture: "https://example.com/profiles/mengtech.jpg",
      verifiedProfile: false,
    );

    User limhao = User(
      firstName: "Limhao",
      lastName: "Tan",
      email: "limhao@example.com",
      phone: "+85555667788",
      profilePicture: "https://example.com/profiles/limhao.jpg",
      verifiedProfile: true,
    );

    User sovanda = User(
      firstName: "Sovanda",
      lastName: "Kim",
      email: "sovanda@example.com",
      phone: "+85511223344",
      profilePicture: "https://example.com/profiles/sovanda.jpg",
      verifiedProfile: false,
    );
    // Mock data
    List<Ride> rides = [
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 5, minutes: 30)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 7, minutes: 30)),
        driver: kannika,
        availableSeats: 2,
        pricePerSeat: 10.0,
        acceptPets: RidesFilter(acceptPets: false),
      ),
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 20)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
        driver: chaylim,
        availableSeats: 0,
        pricePerSeat: 12.0,
        acceptPets: RidesFilter(acceptPets: false),
      ),
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 5)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
        driver: mengtech,
        availableSeats: 1,
        pricePerSeat: 8.0,
        acceptPets: RidesFilter(acceptPets: false),
      ),
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 20)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
        driver: limhao,
        availableSeats: 2,
        pricePerSeat: 15.0,
        acceptPets: RidesFilter(acceptPets: true),
      ),
      Ride(
        departureLocation: Location(name: "Battambang", country: Country.cambodia),
        arrivalLocation: Location(name: "Siem Reap", country: Country.cambodia),
        departureDate: DateTime.now().add(Duration(hours: 5)),
        arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
        driver: sovanda,
        availableSeats: 1,
        pricePerSeat: 9.0,
        acceptPets: RidesFilter(acceptPets: false),
      ),
    ];
    
    return rides;
  }
}