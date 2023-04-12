import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = 'https://www.amazon.com.mx/?ref_=nav_signin&';
        // await FlutterBarcodeScanner.scanBarcode(
        //     '#3D88EF', 'Cancelar', false, ScanMode.QR);

        print(barcodeScanRes);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
