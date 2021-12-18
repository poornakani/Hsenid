import 'dart:io';

import 'package:flutter/material.dart';

class RefreshWidget extends StatefulWidget {
  final GlobalKey<RefreshIndicatorState> keyRefresh;
  final Widget child;
  final Future Function() onRefresh;

  const RefreshWidget({
    Key key,
    this.keyRefresh,
    @required this.onRefresh,
    @required this.child,
  }) : super(key: key);

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) =>
      Platform.isAndroid ? buildAndroidList() : null;

  Widget buildAndroidList() => RefreshIndicator(
    key: widget.keyRefresh,
    onRefresh: widget.onRefresh,
    child: widget.child,
  );

}