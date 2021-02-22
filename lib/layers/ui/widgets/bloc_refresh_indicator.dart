import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockRefreshIndicator<B extends Bloc<dynamic, S>, S> extends StatefulWidget {
  final void Function() onRefresh;
  final bool Function(S) isRefreshingState;
  final Widget child;

  const BlockRefreshIndicator({
    @required this.onRefresh,
    @required this.isRefreshingState,
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  _BlocRefreshIndicatorState<B, S> createState() => _BlocRefreshIndicatorState<B, S>();
}

class _BlocRefreshIndicatorState<B extends Bloc<dynamic, S>, S>
    extends State<BlockRefreshIndicator<B, S>> {
  var _refreshCompleter = Completer()..complete();

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(listener: (context, state) {
      if (!widget.isRefreshingState(state)){
        if (_refreshCompleter !=null && !_refreshCompleter.isCompleted){
          _refreshCompleter.complete();
        }
      }
    }, child: RefreshIndicator(
      onRefresh: () async {
        _refreshCompleter = Completer();
        widget.onRefresh();
        await _refreshCompleter.future;
      },
      child: widget.child,
    ),);
  }
}
