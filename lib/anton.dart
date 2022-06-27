import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('result')),

      body:     Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Text('bena', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            ),

          ],
        ),
      ),
    );
  }

// _buildChild(BuildContext context) => Column(
//     children: <Widget>[
//       Container(
//         width: double.infinity,
//       ),
//       SizedBox(height: 8,),
//       Padding(
//         padding: const EdgeInsets.only(right: 16, left: 16),
//         child: Text('bena', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
//       ),
//
//     ],
//   );
}