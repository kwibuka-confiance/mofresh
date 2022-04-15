import 'package:flutter/material.dart';

class UserTask {
  String name;
  IconData icon;
  String id;

  UserTask({required this.id, required this.icon, required this.name});
}

List<UserTask> userList = [
  UserTask(id: "1", icon: Icons.manage_accounts, name: 'Dashboard'),
  UserTask(id: "2", icon: Icons.mobile_friendly, name: 'Invite a friend'),
  UserTask(id: "3", icon: Icons.support, name: 'Help & support'),
  UserTask(id: "4", icon: Icons.logout, name: 'Logout'),
];
