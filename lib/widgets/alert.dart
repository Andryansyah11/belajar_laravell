import 'package:flutter/material.dart';


class AlertMessage {
  showAlert(BuildContext context, message, status) {
    Color? warnafill;
    Color warnagaris;
    if (status) {
      warnafill = Colors.green[200];
      warnagaris = Colors.green;
    } else {
      warnafill = Colors.pink[200];
      warnagaris = Colors.red;
    }


    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: warnafill,
            border: Border.all(color: warnagaris, width: 3),
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                spreadRadius: 2.0,
                blurRadius: 8.0,
                offset: Offset(2, 4),
              )
            ],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Icon(Icons.favorite, color: Colors.green),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(message,
                    style:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => {debugPrint("Undid")}, child: Text("X"))
            ],
          )),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


Future showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = MaterialButton(
      shape: BeveledRectangleBorder(side: BorderSide()),
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop({'status': false});
      },
    );
    Widget continueButton = MaterialButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop({'status': true});
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}