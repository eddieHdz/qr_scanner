import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

class DireccionesScreen extends StatelessWidget {
  const DireccionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}
