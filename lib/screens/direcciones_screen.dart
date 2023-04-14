import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class DireccionesScreen extends StatelessWidget {
  const DireccionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(
            Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scanListProvider.scans[index].valor),
          subtitle: Text(scanListProvider.scans[index].id.toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => print('abrir algo'),
        );
      },
    );
  }
}
