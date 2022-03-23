import 'package:flutter/material.dart';

class CertificateContainer extends StatefulWidget {
  const CertificateContainer({Key? key}) : super(key: key);

  @override
  State<CertificateContainer> createState() => _CertificateContainerState();
}

class _CertificateContainerState extends State<CertificateContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text("Certificate Page")),
    );
  }
}
