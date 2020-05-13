import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:io' show Platform;

//wifi

class WifiPage extends StatefulWidget {
  WifiPage({Key key}) : super(key: key);

  @override
  _WifiPageState createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2171F5),
                Color(0xFF49A2FC),
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "WiFi设置",
          style: TextStyle(
            fontFamily: "NotoSerifSC",
          ),
        ),
      ),
      body: FlutterWifiIoT(),
    );
  }
}

const String STA_DEFAULT_SSID = "STA_SSID";
const String STA_DEFAULT_PASSWORD = "STA_PASSWORD";
const NetworkSecurity STA_DEFAULT_SECURITY = NetworkSecurity.WPA;

const String AP_DEFAULT_SSID = "AP_SSID";
const String AP_DEFAULT_PASSWORD = "AP_PASSWORD";

class FlutterWifiIoT extends StatefulWidget {
  @override
  _FlutterWifiIoTState createState() => _FlutterWifiIoTState();
}

class _FlutterWifiIoTState extends State<FlutterWifiIoT> {
  String _sPreviousAPSSID = "";
  String _sPreviousPreSharedKey = "";

  List<WifiNetwork> _htResultNetwork;
  Map<String, bool> _htIsNetworkRegistered = Map();

  bool _isEnabled = false;
  bool _isConnected = false;
  bool _isWiFiAPEnabled = false;
  bool _isWiFiAPSSIDHidden = false;
  bool _isWifiAPSupported = true;

  @override
  initState() {
    WiFiForIoTPlugin.isEnabled().then((val) {
      if (val != null) {
        _isEnabled = val;
      }
    });

    WiFiForIoTPlugin.isConnected().then((val) {
      if (val != null) {
        _isConnected = val;
      }
    });

    WiFiForIoTPlugin.isWiFiAPEnabled().then((val) {
      if (val != null) {
        _isWiFiAPEnabled = val;
      }
    }).catchError((val) => _isWifiAPSupported = false);

    WiFiForIoTPlugin.isWiFiAPSSIDHidden().then((val) {
      if (val != null) {
        _isWiFiAPSSIDHidden = val;
      }
    }).catchError((val) => _isWifiAPSupported = false);

    super.initState();
  }

  storeAndConnect(String psSSID, String psKey) async {
    await storeAPInfos();
    await WiFiForIoTPlugin.setWiFiAPSSID(psSSID);
    await WiFiForIoTPlugin.setWiFiAPPreSharedKey(psKey);
  }

  storeAPInfos() async {
    String sAPSSID;
    String sPreSharedKey;
    try {
      sAPSSID = await WiFiForIoTPlugin.getWiFiAPSSID();
    } on PlatformException {
      sAPSSID = "";
    }

    try {
      sPreSharedKey = await WiFiForIoTPlugin.getWiFiAPPreSharedKey();
    } on PlatformException {
      sPreSharedKey = "";
    }

    setState(() {
      _sPreviousAPSSID = sAPSSID;
      _sPreviousPreSharedKey = sPreSharedKey;
    });
  }

  restoreAPInfos() async {
    WiFiForIoTPlugin.setWiFiAPSSID(_sPreviousAPSSID);
    WiFiForIoTPlugin.setWiFiAPPreSharedKey(_sPreviousPreSharedKey);
  }

  // [sAPSSID, sPreSharedKey]
  Future<List<String>> getWiFiAPInfos() async {
    String sAPSSID;
    String sPreSharedKey;
    try {
      sAPSSID = await WiFiForIoTPlugin.getWiFiAPSSID();
    } on Exception {
      sAPSSID = "";
    }

    try {
      sPreSharedKey = await WiFiForIoTPlugin.getWiFiAPPreSharedKey();
    } on Exception {
      sPreSharedKey = "";
    }

    return [sAPSSID, sPreSharedKey];
  }

  Future<WIFI_AP_STATE> getWiFiAPState() async {
    int iWiFiState;
    WIFI_AP_STATE wifiAPState;
    try {
      iWiFiState = await WiFiForIoTPlugin.getWiFiAPState();
    } on Exception {
      iWiFiState = WIFI_AP_STATE.WIFI_AP_STATE_FAILED.index;
    }

    if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_DISABLING.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_DISABLING;
    } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_DISABLED.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_DISABLED;
    } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_ENABLING.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_ENABLING;
    } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_ENABLED.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_ENABLED;
    } else if (iWiFiState == WIFI_AP_STATE.WIFI_AP_STATE_FAILED.index) {
      wifiAPState = WIFI_AP_STATE.WIFI_AP_STATE_FAILED;
    }

    return wifiAPState;
  }

  Future<List<APClient>> getClientList(
      bool onlyReachables, int reachableTimeout) async {
    List<APClient> htResultClient;
    try {
      htResultClient = await WiFiForIoTPlugin.getClientList(
          onlyReachables, reachableTimeout);
    } on PlatformException {
      htResultClient = List<APClient>();
    }

    return htResultClient;
  }

  Future<List<WifiNetwork>> loadWifiList() async {
    List<WifiNetwork> htResultNetwork;
    try {
      htResultNetwork = await WiFiForIoTPlugin.loadWifiList();
    } on PlatformException {
      htResultNetwork = List<WifiNetwork>();
    }

    return htResultNetwork;
  }

  isRegisteredWifiNetwork(String ssid) async {
    bool bIsRegistered;
    try {
      bIsRegistered = await WiFiForIoTPlugin.isRegisteredWifiNetwork(ssid);
    } on PlatformException {
      bIsRegistered = false;
    }

    setState(() {
      _htIsNetworkRegistered[ssid] = bIsRegistered;
    });
  }

  void showClientList() async {
    /// Refresh the list and show in console
    getClientList(false, 300).then((val) => val.forEach((oClient) {}));
  }

  Widget getWidgets() {
    WiFiForIoTPlugin.isConnected().then((val) => setState(() {
          _isConnected = val;
        }));

    // disable scanning for ios as not supported
    if (_isConnected || Platform.isIOS) {
      _htResultNetwork = null;
    }

    if (_htResultNetwork != null && _htResultNetwork.length > 0) {
      List<ListTile> htNetworks = List();

      _htResultNetwork.forEach((oNetwork) {
        PopupCommand oCmdConnect = PopupCommand("Connect", oNetwork.ssid);
        PopupCommand oCmdRemove = PopupCommand("Remove", oNetwork.ssid);

        List<PopupMenuItem<PopupCommand>> htPopupMenuItems = List();

        htPopupMenuItems.add(
          PopupMenuItem<PopupCommand>(
            value: oCmdConnect,
            child: const Text('Connect'),
          ),
        );

        setState(() {
          isRegisteredWifiNetwork(oNetwork.ssid);
          if (_htIsNetworkRegistered.containsKey(oNetwork.ssid) &&
              _htIsNetworkRegistered[oNetwork.ssid]) {
            htPopupMenuItems.add(
              PopupMenuItem<PopupCommand>(
                value: oCmdRemove,
                child: const Text('Remove'),
              ),
            );
          }

          htNetworks.add(
            ListTile(
              title: Text("" +
                  oNetwork.ssid +
                  ((_htIsNetworkRegistered.containsKey(oNetwork.ssid) &&
                          _htIsNetworkRegistered[oNetwork.ssid])
                      ? " *"
                      : "")),
              trailing: PopupMenuButton<PopupCommand>(
                padding: EdgeInsets.zero,
                onSelected: (PopupCommand poCommand) {
                  switch (poCommand.command) {
                    case "Connect":
                      WiFiForIoTPlugin.connect(STA_DEFAULT_SSID,
                          password: STA_DEFAULT_PASSWORD,
                          joinOnce: true,
                          security: STA_DEFAULT_SECURITY);
                      break;
                    case "Remove":
                      WiFiForIoTPlugin.removeWifiNetwork(poCommand.argument);
                      break;
                    default:
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => htPopupMenuItems,
              ),
            ),
          );
        });
      });

      return ListView(
        padding: kMaterialListPadding,
        children: htNetworks,
      );
    } else {
      return SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: Platform.isIOS
                ? getButtonWidgetsForiOS()
                : getButtonWidgetsForAndroid(),
          ),
        ),
      );
    }
  }

  List<Widget> getButtonWidgetsForAndroid() {
    List<Widget> htPrimaryWidgets = List();

    WiFiForIoTPlugin.isEnabled().then((val) => setState(() {
          _isEnabled = val;
        }));

    if (_isEnabled) {
      htPrimaryWidgets.addAll([
        SizedBox(height: 10),
        // Text("WiFi Enabled"),
        // RaisedButton(
        //   child: Text("Disable"),
        //   onPressed: () {
        //     WiFiForIoTPlugin.setEnabled(false);
        //   },
        // ),
      ]);

      WiFiForIoTPlugin.isConnected().then((val) {
        if (val != null) {
          setState(() {
            _isConnected = val;
          });
        }
      });

      if (_isConnected) {
        htPrimaryWidgets.addAll(<Widget>[
          Text(
            "WiFi 已连接",
            style: TextStyle(fontSize: 20, fontFamily: "NotoSerifSC"),
          ),
          SizedBox(
            height: 50,
          ),
          FutureBuilder(
            future: WiFiForIoTPlugin.getSSID(),
            initialData: "Loading..",
            builder: (BuildContext context, AsyncSnapshot<String> ssid) {
              // Text("SSID: ${ssid.data}")
              return Text(
                "SSID : ${ssid.data}",
                style: TextStyle(fontSize: 20, fontFamily: "NotoSerifSC"),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'WiFi 密码：',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "NotoSerifSC",
                ),
                hintText: '请输入当前WiFi密码',
                hintStyle: TextStyle(color: Colors.grey),
                hintMaxLines: 1,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            width: 200,
            child: CupertinoButton(
              color: Colors.pink,
              child: Text("提交"),
              onPressed: () {
                BotToast.showText(text: "提交成功");
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          )
        ]);
      } else {
        htPrimaryWidgets.addAll(<Widget>[
          Text(
            "WiFi 未连接",
            style: TextStyle(fontSize: 20, fontFamily: "NotoSerifSC"),
          ),
        ]);
      }
    } else {
      htPrimaryWidgets.addAll(<Widget>[
        SizedBox(height: 10),
        Text(
          "WiFi 未连接",
          style: TextStyle(fontSize: 20, fontFamily: "NotoSerifSC"),
        ),
        CupertinoButton(
          child: Text(
            "打开 WiFi",
            style: TextStyle(fontSize: 20, fontFamily: "NotoSerifSC"),
          ),
          onPressed: () {
            setState(() {
              WiFiForIoTPlugin.setEnabled(true);
            });
          },
          color: Colors.blue,
          pressedOpacity: .5,
        ),
      ]);
    }

    htPrimaryWidgets.add(Divider(
      height: 32.0,
    ));

    if (_isWifiAPSupported) {
      htPrimaryWidgets.addAll(<Widget>[
        FutureBuilder(
            future: getWiFiAPState(),
            initialData: WIFI_AP_STATE.WIFI_AP_STATE_DISABLED,
            builder:
                (BuildContext context, AsyncSnapshot<WIFI_AP_STATE> wifiState) {
              if (wifiState.data == WIFI_AP_STATE.WIFI_AP_STATE_ENABLED) {
                RaisedButton(
                  child: Text("Get Client List"),
                  onPressed: () {
                    showClientList();
                  },
                );
              }
              return Text(wifiState.data.toString());
            }),
      ]);

      WiFiForIoTPlugin.isWiFiAPEnabled()
          .then((val) => setState(() {
                _isWiFiAPEnabled = val;
              }))
          .catchError((val) => _isWiFiAPEnabled = false);
      if (_isWiFiAPEnabled) {
        htPrimaryWidgets.addAll(<Widget>[
          Text("Wifi AP Enabled"),
          RaisedButton(
            child: Text("Disable"),
            onPressed: () {
              WiFiForIoTPlugin.setWiFiAPEnabled(false);
            },
          ),
        ]);
      } else {
        htPrimaryWidgets.addAll(<Widget>[
          Text("Wifi AP Disabled"),
          RaisedButton(
            child: Text("Enable"),
            onPressed: () {
              WiFiForIoTPlugin.setWiFiAPEnabled(true);
            },
          ),
        ]);
      }

      WiFiForIoTPlugin.isWiFiAPSSIDHidden()
          .then((val) => setState(() {
                _isWiFiAPSSIDHidden = val;
              }))
          .catchError((val) => _isWiFiAPSSIDHidden = false);
      if (_isWiFiAPSSIDHidden) {
        htPrimaryWidgets.add(Text("SSID is hidden"));
        !_isWiFiAPEnabled
            ? RaisedButton(
                child: Text("Show"),
                onPressed: () {
                  WiFiForIoTPlugin.setWiFiAPSSIDHidden(false);
                },
              )
            : Container(width: 0, height: 0);
      } else {
        htPrimaryWidgets.add(Text("SSID is visible"));
        !_isWiFiAPEnabled
            ? RaisedButton(
                child: Text("Hide"),
                onPressed: () {
                  WiFiForIoTPlugin.setWiFiAPSSIDHidden(true);
                },
              )
            : Container(width: 0, height: 0);
      }
      FutureBuilder(
          future: getWiFiAPInfos(),
          initialData: List<String>(),
          builder: (BuildContext context, AsyncSnapshot<List<String>> info) {
            htPrimaryWidgets.addAll(<Widget>[
              Text("SSID : ${info.data[0]}"),
            ]);
            return;
          });
    } else {}

    return htPrimaryWidgets;
  }

  List<Widget> getButtonWidgetsForiOS() {
    List<Widget> htPrimaryWidgets = List();

    WiFiForIoTPlugin.isEnabled().then((val) => setState(() {
          _isEnabled = val;
        }));

    if (_isEnabled) {
      htPrimaryWidgets.add(Text("Wifi Enabled"));
      WiFiForIoTPlugin.isConnected().then((val) => setState(() {
            _isConnected = val;
          }));

      String _sSSID;
      if (_isConnected) {
        htPrimaryWidgets.addAll(<Widget>[
          Text("Connected"),
          FutureBuilder(
              future: WiFiForIoTPlugin.getSSID(),
              initialData: "Loading..",
              builder: (BuildContext context, AsyncSnapshot<String> ssid) {
                _sSSID = ssid.data;
                return Text("SSID: ${ssid.data}");
              }),
        ]);

        if (_sSSID == STA_DEFAULT_SSID) {
          htPrimaryWidgets.addAll(<Widget>[
            RaisedButton(
              child: Text("Disconnect"),
              onPressed: () {
                WiFiForIoTPlugin.disconnect();
              },
            ),
          ]);
        } else {
          htPrimaryWidgets.addAll(<Widget>[
            RaisedButton(
              child: Text("Connect to '$AP_DEFAULT_SSID'"),
              onPressed: () {
                WiFiForIoTPlugin.connect(STA_DEFAULT_SSID,
                    password: STA_DEFAULT_PASSWORD,
                    joinOnce: true,
                    security: NetworkSecurity.WPA);
              },
            ),
          ]);
        }
      } else {
        htPrimaryWidgets.addAll(<Widget>[
          Text("Disconnected"),
          RaisedButton(
            child: Text("Connect to '$AP_DEFAULT_SSID'"),
            onPressed: () {
              WiFiForIoTPlugin.connect(STA_DEFAULT_SSID,
                  password: STA_DEFAULT_PASSWORD,
                  joinOnce: true,
                  security: NetworkSecurity.WPA);
            },
          ),
        ]);
      }
    } else {
      htPrimaryWidgets.addAll(<Widget>[
        Text("Wifi Disabled?"),
        RaisedButton(
          child: Text("Connect to '$AP_DEFAULT_SSID'"),
          onPressed: () {
            WiFiForIoTPlugin.connect(STA_DEFAULT_SSID,
                password: STA_DEFAULT_PASSWORD,
                joinOnce: true,
                security: NetworkSecurity.WPA);
          },
        ),
      ]);
    }

    return htPrimaryWidgets;
  }

  @override
  Widget build(BuildContext poContext) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: getWidgets(),
      ),
    );
  }
}

class PopupCommand {
  String command;
  String argument;

  PopupCommand(this.command, this.argument);
}
