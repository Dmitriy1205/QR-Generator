import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_authorization/api/auth.dart';
import 'package:qr_authorization/api/response_model.dart';
import 'package:qr_authorization/bloc/screen_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_authorization/assets/constants.dart' as constant;

class BlocQrWidget extends StatefulWidget {
  const BlocQrWidget({Key? key}) : super(key: key);

  @override
  State<BlocQrWidget> createState() => _BlocQrWidgetState();
}

class _BlocQrWidgetState extends State<BlocQrWidget> {
  late ScreenBloc _screenBloc = ScreenBloc(AuthPlink());

  late Timer timer;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 60),
      (timer) => setState(() {
        _screenBloc = ScreenBloc(AuthPlink());
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScreenBloc, ScreenState>(
        bloc: _screenBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ScreenInitial) {
            return const CircularProgressIndicator();
          }
          if (state is ScreenLoaded) {
            return qrWidget(state.items);
          } else {
            return Container();
          }
        });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
    _screenBloc.close();
  }
}

Card qrWidget(ResponseModel items) {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: QrImage(
      data: '${constant.socketEndpoint} + ${items.slug}/',
      size: 140,
    ),
  );
}
