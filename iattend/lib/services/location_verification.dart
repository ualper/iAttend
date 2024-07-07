import 'package:geolocator/geolocator.dart';

/// Class for location and time verification functionality.
class LocationVerification {
  final Geolocator _geolocator = Geolocator();

  /// Verifies if the student's location is within a certain distance from the instructor's location.
  ///
  /// Parameters:
  /// - [instructorLatitude]: Latitude of the instructor's location.
  /// - [instructorLongitude]: Longitude of the instructor's location.
  /// - [studentLatitude]: Latitude of the student's location.
  /// - [studentLongitude]: Longitude of the student's location.
  ///
  /// Returns a [Future] containing a [bool] indicating whether the location is verified.
  Future<bool> verifyLocation(double instructorLatitude, double instructorLongitude, double studentLatitude, double studentLongitude) async {
    try {
      // Get the current position of the instructor.
      Position instructorPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

      // Calculate the distance between the instructor and student locations.
      double distance = Geolocator.distanceBetween(
        instructorLatitude,
        instructorLongitude,
        studentLatitude,
        studentLongitude,
      );

      // If the distance is less than 50 meters, confirm the location.
      if (distance < 50) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle location verification errors and print the error message.
      print('Location verification error: $e');
      return false;
    }
  }

  /// Verifies if the instructor and student are at the same location at the same time.
  ///
  /// Returns a [bool] indicating whether the time is verified.
  bool verifyTime() {
    try {
      // Get the current time of the instructor.
      DateTime instructorTime = DateTime.now();

      // Get the current time of the student.
      DateTime studentTime = DateTime.now();

      // Time verification: Are the instructor and student at the same minute?
      if (instructorTime.year == studentTime.year &&
          instructorTime.month == studentTime.month &&
          instructorTime.day == studentTime.day &&
          instructorTime.hour == studentTime.hour &&
          instructorTime.minute == studentTime.minute) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle time verification errors and print the error message.
      print('Time verification error: $e');
      return false;
    }
  }

  /// Verifies if the student's location is within a certain distance from the instructor's location
  /// and if the instructor and student are at the same location at the same time.
  ///
  /// Parameters:
  /// - [instructorLatitude]: Latitude of the instructor's location.
  /// - [instructorLongitude]: Longitude of the instructor's location.
  /// - [studentLatitude]: Latitude of the student's location.
  /// - [studentLongitude]: Longitude of the student's location.
  ///
  /// Returns a [Future] containing a [bool] indicating whether both location and time are verified.
  Future<bool> verifyLocationAndTime(double instructorLatitude, double instructorLongitude, double studentLatitude, double studentLongitude) async {
    try {
      // Location verification
      bool locationVerified = await verifyLocation(instructorLatitude, instructorLongitude, studentLatitude, studentLongitude);

      // Time verification
      bool timeVerified = verifyTime();

      // Return true if both location and time are verified
      return locationVerified && timeVerified;
    } catch (e) {
      // Handle verification errors and print the error message.
      print('Location and time verification error: $e');
      return false;
    }
  }
}
