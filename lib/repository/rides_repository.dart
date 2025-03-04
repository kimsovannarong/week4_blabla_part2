
import 'package:week4_blabla/model/ride/ride.dart';
import 'package:week4_blabla/model/ride_pref/ride_pref.dart';
import 'package:week4_blabla/service/rides_service.dart';

abstract class RidesRepository {
  List<Ride> getRides (RidePreference preference, RidesFilter? filter);
}