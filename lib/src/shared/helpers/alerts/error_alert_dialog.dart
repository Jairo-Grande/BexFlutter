import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

errorAlertDialog(
    {required BuildContext context,
    required String error,
    required IconData iconData,
    required String buttonText}) {
  final theme = Theme.of(context);

  if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) {
          Size size = MediaQuery.of(context).size;
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: SizedBox(
              width: size.width * 0.3,
              height: size.height * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.error_outline_rounded,
                          color: theme.errorColor, size: 50),
                      const Text(
                        textAlign: TextAlign.center,
                        "Oh no!\n something went wrong.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        error,
                        style: TextStyle(
                          color: Colors.red.shade900,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 40,
                            width: size.width * 0.5,
                            decoration: BoxDecoration(
                              //  color: activeColor,
                              border: Border.all(color: theme.errorColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Try again",
                                style: TextStyle(
                                  color: theme.errorColor,
                                  fontSize: 14,
                                ),
                              ),
                            )),
                      )
                    ]),
              ),
            ),
          );
        });
  } else {
    showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      iconData,
                      color: Colors.red.shade900,
                      size: 40,
                    ),
                  ),
                  const Text("Oh no!\n something went wrong."),
                ],
              ),
              content: Column(
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    error,
                    style: TextStyle(
                      color: Colors.red.shade900,
                    ),
                  ),
                ],
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(buttonText),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
