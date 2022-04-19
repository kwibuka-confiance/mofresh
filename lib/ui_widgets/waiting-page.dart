import 'package:flutter/material.dart';

class WaitingPage extends StatefulWidget {
  String routePage;
  WaitingPage(this.routePage, {Key? key}) : super(key: key);

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  void nextPage() {
    Future.delayed(const Duration(milliseconds: 2000), () async {
      Navigator.of(context).pushReplacementNamed(widget.routePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
