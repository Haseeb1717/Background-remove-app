import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();
  final Color pinkColor = Color(0xFFEA4C89);
  int _currentPage = 0;
  Timer? _timer;

  final List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0Ng82brfs1p1sCmw6oNCgt_CffxjXbpo_3g&s',
    'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs2/320769654/original/e1e15220c26837da31c6b54cd6361f0995ccf27a/remove-background-and-make-transparent-profeesionally-in-24h.jpg',
    'https://d38b044pevnwc9.cloudfront.net/site/en/static/SEO/home.jpg',
  ];

  final List<Map<String, String>> sliderTexts = [
    {'title':'Remove background ', 'subtitle': 'Now you can remove background by single click'},
    {'title': 'Enhance Photos', 'subtitle': 'with smart filters'},
    {'title': 'Download & Share', 'subtitle': 'in one tap'},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      int nextPage = (_controller.page?.round() ?? 0) + 1;
      if (nextPage >= imageUrls.length) nextPage = 0;
      _controller.animateToPage(nextPage, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(imageUrls[index], fit: BoxFit.cover, width: double.infinity);
            },
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent, Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Top Text
          Positioned(
            top: 100,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sliderTexts[_currentPage]['title']!, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(sliderTexts[_currentPage]['subtitle']!, style: TextStyle(color: Colors.white70, fontSize: 16)),
              ],
            ),
          ),
          // Bottom Buttons & Indicators
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: Column(
              children: [
                SmoothPageIndicator(controller: _controller, count: imageUrls.length, effect: WormEffect(activeDotColor: pinkColor, dotColor: Colors.white38, dotHeight: 8, dotWidth: 8)),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: pinkColor, foregroundColor: Colors.white, minimumSize: Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  child: Text("Create Account"),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: OutlinedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, minimumSize: Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
