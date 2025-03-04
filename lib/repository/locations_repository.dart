import 'package:week4_blabla/model/ride/locations.dart';

import '../model/ride_pref/ride_pref.dart';

abstract class LocationsRepository {
  List<Location> getLocations();
}
