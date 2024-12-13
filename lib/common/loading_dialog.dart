import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      }
    );
    
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.of(context).pop(LoadingDialog);
  }
}