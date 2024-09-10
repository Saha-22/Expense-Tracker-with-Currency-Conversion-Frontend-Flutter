import 'package:flutter/material.dart';
import 'package:expense_tracker/controllers/auth.dart';
import 'package:expense_tracker/resources/app_colours.dart';
import 'package:expense_tracker/resources/app_routes.dart';
import 'package:expense_tracker/resources/app_strings.dart';
import 'package:expense_tracker/utils/helper.dart';
import 'package:expense_tracker/views/components/ui/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.bgColour,
      appBar: buildAppBar(context, AppStrings.appName),
      body: Center(
        child: TextButton(
          onPressed: _logout,
          child: Text(AppStrings.logout),
        ),
      ),
    );
  }

  void _logout() async {

    final result = await AuthController.logout();

    if(!result.isSuccess){
      Helper.snackBar(context, message: result.message, isSuccess: false);
      return;
    }

    Navigator.pushReplacementNamed(context, AppRoutes.walkthrough);
  }
}
