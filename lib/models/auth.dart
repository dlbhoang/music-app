import 'package:flutter/material.dart';

class AuthModel {
  final String name; 
  final String email;
  final String password;
  final BuildContext context;
  final Function(bool) setLoading;

  AuthModel({
    required this.name,
    required this.email,
    required this.password,
    required this.context,
    required this.setLoading,
  });
}
