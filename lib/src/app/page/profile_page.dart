import 'dart:async';

import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth/secrets.dart';
import '../../domain/repository/session_service.dart';
import '../colors.dart';
import '../component/header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SessionService _sessionService = Get.find<SessionService>();
  final FitbitActivityTimeseriesDataManager
      _fitbitActivityTimeseriesDataManager =
      Get.find<FitbitActivityTimeseriesDataManager>();
  bool? authenticated;
  List<FitbitActivityTimeseriesData>? stepsData;

  @override
  void initState() {
    super.initState();
    Future.sync(FitbitConnector.isTokenValid).then((value) async {
      setState(() {
        authenticated = value;
      });
      if (authenticated == true) {
        await _fetchActivityData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = _sessionService.getSession().user;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: RunSyncTheme.orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 95,
            left: MediaQuery.of(context).size.width / 2 - 70,
            child: CircleAvatar(
              radius: 70,
              backgroundImage:
                  AssetImage(user?.avatar ?? 'assets/images/fallback.png'),
            ),
          ),
          Positioned(
            top: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Header(text: 'My profile'),
              ],
            ),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Column(children: [
              authenticated == null
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          children: [
                            authenticated!
                                ? ElevatedButton(
                                    onPressed: _disconnectFromFitbit,
                                    child: const Text('Disconnect Fitbit'),
                                  )
                                : ElevatedButton(
                                    onPressed: _connectToFitbit,
                                    child: const Text('Connect Fitbit'),
                                  ),
                          ],
                        ),
                        Row(
                          children: [
                            stepsData == null ?
                            Container() :
                            Text('Today, you walked ${stepsData?[0].value?.toStringAsFixed(2)} km'),
                          ],
                        )
                      ],
                    )
            ]),
          ),
        ],
      ),
    );
  }

  Future<void> _connectToFitbit() async {
    await FitbitConnector.authorize(
            context: context,
            clientID: Secrets.fitbitClientId,
            clientSecret: Secrets.fitbitClientSecret,
            redirectUri: Secrets.fitbitRedirectUri,
            callbackUrlScheme: Secrets.fitbitCallbackScheme)
        .then((userId) {
      setState(() {
        _sessionService.getSession().user?.fitbitUserId = userId;
        authenticated = true;
      });
    });
  }

  Future<void> _disconnectFromFitbit() async {
    await FitbitConnector.unauthorize(
      clientID: Secrets.fitbitClientId,
      clientSecret: Secrets.fitbitClientSecret,
    ).then((_) {
      setState(() {
        authenticated = false;
      });
    });
  }

  Future<void> _fetchActivityData() async {
    await _fitbitActivityTimeseriesDataManager
        .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
      date: DateTime.now(),
      userID: _sessionService.getSession().user!.fitbitUserId,
      resource: _fitbitActivityTimeseriesDataManager.type,
    ))
        .then((value) {
      setState(() {
        stepsData = value as List<FitbitActivityTimeseriesData>;
      });
    });
  }
}
