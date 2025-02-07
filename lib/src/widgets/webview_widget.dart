import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../core/core.dart';

class WebviewScreen extends StatefulWidget {
  final String url;
  const WebviewScreen({super.key, required this.url});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;

  final InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllow: "camera; microphone",
    iframeAllowFullscreen: true,
  );

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb &&
        [TargetPlatform.iOS, TargetPlatform.android]
            .contains(defaultTargetPlatform)) {
      pullToRefreshController = PullToRefreshController(
        settings: PullToRefreshSettings(color: Colors.blue),
        onRefresh: () async {
          if (defaultTargetPlatform == TargetPlatform.android) {
            webViewController?.reload();
          } else if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()),
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            initialUserScripts: UnmodifiableListView<UserScript>([]),
            initialSettings: settings,
            pullToRefreshController: pullToRefreshController,
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onPermissionRequest: (controller, request) async {
              return PermissionResponse(
                resources: request.resources,
                action: PermissionResponseAction.GRANT,
              );
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url!;
              if (![
                "http",
                "https",
                "file",
                "chrome",
                "data",
                "javascript",
                "about"
              ].contains(uri.scheme)) {
                try {
                  await uri.toString().launchInBrowser(isInAppView: true);
                  return NavigationActionPolicy.CANCEL;
                } catch (e) {
                  return NavigationActionPolicy.CANCEL;
                }
              }
              return NavigationActionPolicy.ALLOW;
            },
            onLoadStop: (controller, url) async {
              pullToRefreshController?.endRefreshing();
              setState(() {
                this.url = url.toString();
              });
            },
            onReceivedError: (controller, request, error) {
              pullToRefreshController?.endRefreshing();
            },
            onProgressChanged: (controller, progress) {
              if (progress == 100) {
                pullToRefreshController?.endRefreshing();
              }
              setState(() {
                this.progress = progress / 100;
              });
            },
            onUpdateVisitedHistory: (controller, url, isReload) {
              setState(() {
                this.url = url.toString();
              });
            },
            onConsoleMessage: (controller, consoleMessage) {
              customLog(consoleMessage.toString());
            },
          ),
          if (progress < 1.0) LinearProgressIndicator(value: progress),
        ],
      ),
    );
  }
}
