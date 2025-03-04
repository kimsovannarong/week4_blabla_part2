import 'package:week4_blabla/repository/mock/mock_location_repository.dart';
import 'package:week4_blabla/repository/mock/mock_ride_repository.dart';
import 'package:week4_blabla/service/locations_service.dart';
import 'package:week4_blabla/service/rides_service.dart';

void main(){
  //testing with location service 
  LocationsService.initialize(Mocklocationsrepository());
  var locationService =LocationsService.instance;
  print(locationService.availableLocations);
}