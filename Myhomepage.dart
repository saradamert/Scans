import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scaner/Detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late String id = "";
  // late String getid = "";

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    try {
      await FlutterBarcodeScanner.scanBarcode(
              "#ff6666", "Cancel", true, ScanMode.DEFAULT)
          .then((String id) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsPage(id)));
      });
    } on PlatformException {}
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Product Scanner'),
        backgroundColor: Color(0xFF121212),
      ),
      body: Container(
        color: Color(0xFF121212),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              // ignore: deprecated_member_use
              child: FlatButton.icon(
                  color: Colors.white,
                  onPressed: () => scanBarcodeNormal(),
                  label: Text('Scan Product'),
                  icon: Icon(Icons.add_shopping_cart)),
            ),
          ],
        ),
      ),
    );
  }
}
