import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel{
  bool isAdmin;
  String nickname;

  UserModel(@required this.isAdmin, @required this.nickname);
}