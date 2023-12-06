import 'package:flutter/material.dart';

class PrepareDatabaseScreen extends StatefulWidget {
  const PrepareDatabaseScreen({super.key});
  static String routeName = "/prepare_database";

  @override
  State<PrepareDatabaseScreen> createState() => _PrepareDatabaseScreenState();
}

class _PrepareDatabaseScreenState extends State<PrepareDatabaseScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      _isLoading = true;
      // await FirebaseRTDBService.instance.prepareDataBase();
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text("DataLoaded"),
            ),
          );
  }
}
