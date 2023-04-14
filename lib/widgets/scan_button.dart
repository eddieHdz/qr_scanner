import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers.dart';

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
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nuevoScan(barcodeScanRes);
        scanListProvider.nuevoScan('geo:15.33,15.66');
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
