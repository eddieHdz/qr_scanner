import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_models.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final _url = scan.valor;

  if (scan.tipo == 'http') {
    if (await canLaunchUrl(Uri.parse(_url))) {
      await launchUrl(Uri.parse(_url));
    } else {
      throw 'Could not launch $_url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
