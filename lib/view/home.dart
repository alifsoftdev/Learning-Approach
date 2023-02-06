import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFEFDF9),
        leading: Padding(
          padding:  EdgeInsets.only(left: 20),
          child: Image.asset('assets/learning_approach.png',scale: 3,),
        ),
        title: Text("Learning Approach",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://learning-approach.pro/home',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          onPageStarted: (url) {
            print('page Started : $url');
            Future.delayed(const Duration(milliseconds: 1000), () {
              setState(() {
                isLoading = false;
              });
            });
          },
          onPageFinished: (url) {
            print('finished');
            controller.runJavascript(
                "document.getElementsByTagName('header')[0].style.display='none'");
            controller.runJavascript(
                "document.getElementsByTagName('footer')[0].style.display='none'");
          },
        ),
      ),
      
    );
  }
}
