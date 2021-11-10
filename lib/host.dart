import 'package:allinone/Route_Constants/route_constants.dart';
import 'package:allinone/qr_scan.dart';
import 'package:allinone/utils/ad_helper.dart';
import 'package:allinone/utils/utils.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app_theme/theme.dart';
import 'generate.dart';

class HostPage extends StatefulWidget {

  @override
  _HostPageState createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  String selectedPage = RouteConstant.scan;
  bool navSelected = false;
  List<String> pageKeys = [
    RouteConstant.scan,
    RouteConstant.generate
  ];

  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  void _createBannerAd(){
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_){
        setState(() {
          _isAdLoaded = true;
        });
      },onAdFailedToLoad: (ad,error){
        ad.dispose();
      }),
    );
    _bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    _createBannerAd();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _bannerAd.dispose();
    super.dispose();
  }

  selectedNavItem(int index) {
    setState(() {
      // _pageController.animateToPage(index,
      //     duration: Duration(milliseconds: 1), curve: Curves.linear);
      // navSelected = false;
      _currentIndex = index;
      selectedPage = pageKeys[index];
      Utils.dashboardKey.currentState!.pushNamed(selectedPage);
      // Navigator.pushNamed(context,selectedPage);
      print(selectedPage);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        _isAdLoaded ? Container(
          height: _bannerAd.size.height.toDouble(),
          width: _bannerAd.size.width.toDouble(),
          child: AdWidget(ad: _bannerAd),
        ):Text("cant load"),
      ],
      key: Utils.scaffoldKey,
      body: WillPopScope(
        onWillPop: () async => false,
        child: Navigator(
          initialRoute: RouteConstant.scan,
          key: Utils.dashboardKey,
          onGenerateRoute: (settings) {
            Widget page = QrScan();
            switch(settings.name){
              case RouteConstant.scan:
                page = QrScan();
                break;
              case RouteConstant.generate:
                page = GenerateQr();
                break;
            }
            return PageRouteBuilder(
                settings: settings,
                pageBuilder: (_, __, ___) => page
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 28,vertical: 12),
        decoration: BoxDecoration(
            color: CustomizedTheme.primaryBold,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        child: BottomNavyBar(
          itemCornerRadius: 10,
          // containerHeight: 95,
          curve: Curves.bounceIn,
          backgroundColor: CustomizedTheme.primaryBold,
          selectedIndex: _currentIndex,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => selectedNavItem(index),
          items: [
            BottomNavyBarItem(
                inactiveColor: CustomizedTheme.white,
                icon: Icon(Icons.camera),
                title: Text('Scan',style: CustomizedTheme.sf_w_W300_14),
                activeColor: CustomizedTheme.white.withOpacity(.2)
            ),
            BottomNavyBarItem(
                inactiveColor: CustomizedTheme.white,
                icon: Icon(Icons.code),
                title: Text('Generate',style: CustomizedTheme.sf_w_W300_14),
                activeColor: CustomizedTheme.white.withOpacity(.2)
            ),
          ],
        ),
      ),
    );
  }
}
