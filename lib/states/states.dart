import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import './movies.dart';

export 'package:provider/provider.dart';
export 'package:flutter/material.dart';

export './movies.dart';

abstract class BaseState with ChangeNotifier implements BaseStateInterface {
  bool _initDone = false;
  bool get initDone => _initDone;
  @protected
  void setInitDone(bool initDone) {
    _initDone = initDone;
  }

  @override
  @mustCallSuper
  Future<void> init(BuildContext context) async {
    if (!_initDone) {
      _initDone = true;

      notifyListeners();
    }
  }

  @override
  @mustCallSuper
  void uninit() {
    _initDone = false;
  }
}

abstract class BaseStateInterface {
  Future<void> init(BuildContext context);
  void uninit();
}

class States {
  static List<SingleChildStatelessWidget> providers = [
    ..._independentServices,
    ..._dependentServices,
  ];

  static final List<SingleChildStatelessWidget> _independentServices = [
    ChangeNotifierProvider<StateMovies>(
      create: (context) => StateMovies(),
    ),
  ];

  static final List<SingleChildStatelessWidget> _dependentServices = [];
}
