import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_models.dart';

class MapaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}
