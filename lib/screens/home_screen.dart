import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_models.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/providers.dart';
import 'package:qr_scanner/screens/screens.dart';
import 'package:qr_scanner/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scanListProvider.borrarTodos();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasScreen();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesScreen();
      default:
        return MapasScreen();
    }
  }
}
