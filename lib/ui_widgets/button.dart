import "package:flutter/material.dart";

class Button extends StatelessWidget {
  Function buttonHandler;
  Button(this.buttonHandler, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ElevatedButton(
          onPressed: () => buttonHandler(),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              primary: const Color.fromRGBO(104, 153, 17, 1)),
        ),
      ),
    );
  }
}
