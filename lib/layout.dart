
import 'package:education_system/extensions/relative_length.dart';
import 'package:education_system/screens/classroom_screen/classroom_screen.dart';
import 'package:education_system/screens/home_screen/home_screen.dart';
import 'package:education_system/screens/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int index = 0;
  List<Widget> screen = <Widget>[
    const HomeScreen(),
    const ClassroomScreen(),
    const SettingScreen(),
  ];
  @override
  void initState() {
    super.initState();
    index = 0;
  }

  GlobalKey bottomNavigationBarKey = GlobalKey(debugLabel: 'btm_app_bar');
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (index != 0) {
          BottomNavigationBar navigationBar =
              bottomNavigationBarKey.currentWidget as BottomNavigationBar;
          navigationBar.onTap!(0);
        } else {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Alert"),
              content: const Text("Do You Want to Exit ?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("No")),
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: const Text("Yes")),
              ],
            ),
          );
        }
        return false;
      },
      child: Scaffold(
        body: AnimatedIndexedStack(index: index, children: screen),
        bottomNavigationBar: Container(
          height: 10.2.vh,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(232, 232, 232, 0.65),
                spreadRadius: 8,
                blurRadius: 14,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              key: bottomNavigationBarKey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              currentIndex: index,
              onTap: (s) => setState(() => index = s),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Tutors'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.class__rounded), label: 'Classroom'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz), label: 'More'),
              ],
              unselectedLabelStyle: TextStyle(
                fontFamily: 'NeoSans',
                fontSize: 3.2.vw,
              ),
              selectedLabelStyle: TextStyle(
                fontFamily: 'NeoSans',
                fontSize: 3.2.vw,
              ),
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xff336633),
              unselectedItemColor: const Color(0xffB2B5C0),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const AnimatedIndexedStack({
    Key? key,
    required this.index,
    required this.children,
  }) : super(key: key);

  @override
  _AnimatedIndexedStackState createState() => _AnimatedIndexedStackState();
}

class _AnimatedIndexedStackState extends State<AnimatedIndexedStack>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  int _index = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller!,
          curve: Curves.easeIn,
          reverseCurve: Curves.bounceOut),
    );

    _index = widget.index;
    _controller?.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != _index) {
      _controller?.reverse().then((_) {
        setState(() => _index = widget.index);
        _controller?.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return Opacity(
          opacity: _controller!.value,
          child: Transform.scale(
            scale: 1.015 - (_controller!.value * 0.015),
            child: child,
          ),
        );
      },
      child: IndexedStack(
        index: _index,
        children: widget.children,
      ),
    );
  }
}
