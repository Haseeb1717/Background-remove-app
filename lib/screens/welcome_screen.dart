import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:ui'; // Import for ImageFilter
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
    {'title': 'Remove background ', 'subtitle': 'Now you can remove background by single click'},
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
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(imageUrls[index], fit: BoxFit.cover),
                  // Gradient Overlay with slight blur
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.4), Colors.transparent, Colors.black.withOpacity(0.4)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0), // Subtle blur
                      child: Container(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                  // Title and Subtitle with animation on each image
                  Positioned(
                    top: 120,
                    left: 24,
                    right: 24,
                    child: AnimatedOpacity(
                      opacity: _currentPage == index ? 1 : 0,
                      duration: Duration(milliseconds: 1000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sliderTexts[index]['title']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              shadows: [Shadow(offset: Offset(2, 2), blurRadius: 3, color: Colors.black.withOpacity(0.5))],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            sliderTexts[index]['subtitle']!,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Bottom Controls (Page Indicator, Buttons)
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: imageUrls.length,
                  effect: WormEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.blue.withOpacity(0.5),
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 8,
                    type: WormType.thin,
                  ),
                ),
                SizedBox(height: 30),
                // Gradient Button with Icon
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF000000), Color(0xFF1FBCFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                    },
                    icon: Icon(Icons.person_add, color: Colors.white),
                    label: Text("Create Account", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Login Button with Icon
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    icon: Icon(Icons.login, color: Colors.black),
                    label: Text("Login", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
