import 'package:week4_blabla/model/ride/locations.dart';
import 'package:week4_blabla/repository/locations_repository.dart';

class Mocklocationsrepository implements LocationsRepository {
  @override
  List<Location> getLocations() {
    // TODO: implement getLocations       
    return [
        Location(name: 'Phnom Penh', country: Country.cambodia),
        Location(name: 'Siem reap', country: Country.cambodia),
        Location(name: 'Battambang', country: Country.cambodia),
        Location(name: 'Sihaknoukville', country: Country.cambodia),
        Location(name: 'kampot', country: Country.cambodia)
    ];    
  }
}
