import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:we_chats/constant/color.dart';
import 'package:we_chats/constant/dimens.dart';
import 'package:we_chats/data/apply/we_chat_apply.dart';
import 'package:we_chats/data/apply/we_chat_apply_impl.dart';
import 'package:we_chats/data/vos/user_vo.dart';

import '../view_items/qr_scanner_view_items/friend_accept_or_cancel_view_item.dart';

class WeChatQrCodeScannerPage extends StatefulWidget {
  const WeChatQrCodeScannerPage({super.key, required this.loginUserVO});

  final UserVO loginUserVO;

  @override
  State<WeChatQrCodeScannerPage> createState() =>
      _WeChatQrCodeScannerPageState();
}

class _WeChatQrCodeScannerPageState extends State<WeChatQrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final WeChatApply _apply = WeChatApplyImpl();

  UserVO? friendUserVo;
  String? friendQrCode;

  QRViewController? qrViewController;
  Barcode? barcode;

  @override
  void dispose() {
    qrViewController?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrViewController!.pauseCamera();
    }
    qrViewController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          ///Qr Scanner Session
          QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(
                borderColor: kPrimaryColor,
                borderRadius: kSP20x,
                borderWidth: kSP10x,
                cutOutSize: MediaQuery.of(context).size.width * 0.8),
            onQRViewCreated: (QRViewController controller) {
              setState(() {
                qrViewController = controller;
              });
              controller.scannedDataStream.listen((event) {
                setState(() {
                  barcode = event;
                  friendQrCode = barcode?.code ?? '';
                });

                ///Get Friend User Info By Uid or Qr Code
                _apply.getUserInFoByID(friendQrCode!).then((value) {
                  friendUserVo = value;
                });

                /// Friend Accept Or Cancel Dialog
                showDialog(
                    context: context,
                    builder: (context) => FriendAcceptOrCancelDialogItemView(
                          friendUserVO: friendUserVo,
                          loginUserVO: widget.loginUserVO,
                        ));
              });
            },
          ),
        ],
      )),
    );
  }
}
