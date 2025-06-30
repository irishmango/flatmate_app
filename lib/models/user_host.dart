import 'package:flatmate_app/models/household.dart';

class User {
  final String id;
  final String name;
  final bool userType;
  final String email;
  final Household household;

  const User({required this.id, required this.name, required this.userType, required this.email, required this.household,});
}