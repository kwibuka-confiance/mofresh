import 'package:flutter/material.dart';

class SuccessfulyScreen extends StatelessWidget {
  const SuccessfulyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                'https://assets.materialup.com/uploads/81f17b83-d60b-4fef-82f7-2b7c783fbdb0/preview.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                'Payment Done!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green),
              ),
            ),
            const Text('Your Payment has been Successfully transfered! '),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      primary: Theme.of(context).primaryColorDark),
                  child: const Text(
                    'Ok',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => {
                        Navigator.of(context).pushNamed('/dashboard'),
                      }),
            )
          ],
        ),
      ),
    );
  }
}
