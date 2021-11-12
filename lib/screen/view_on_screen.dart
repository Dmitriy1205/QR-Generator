import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_authorization/assets/constants.dart' as constant;
import 'package:qr_authorization/screen/qr_widget.dart';

class ViewOnScreen extends StatefulWidget {
  const ViewOnScreen({Key? key}) : super(key: key);

  @override
  State<ViewOnScreen> createState() => _ViewOnScreenState();
}

class _ViewOnScreenState extends State<ViewOnScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const BlocQrWidget(),
            const SizedBox(height: 60),
            const Text(
              constant.meeting,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: 300, height: 30),
              child: const Text(
                constant.recommendation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 140,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //TODO
              },
              child: const Text(
                constant.help,
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white12),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
