import 'package:flutter/material.dart';

import '../SupportFiles/asset_config.dart';

Widget gifLoadingOverlay() {
  return PopScope(
    // onWillPop: () async => false,
    child: Stack(
      children: [
        const Opacity(
          opacity: 0.1,
          child: ModalBarrier(dismissible: false, color: Colors.white),
        ),
        Center(
            child: Container(
          height: 56,
          width: 56,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        )),
        Center(
          child: Image.asset(
            GIF_LOADER_IMAGE,
            width: 70,
            height: 70,
          ),
        ),
      ],
    ),
  );
}
