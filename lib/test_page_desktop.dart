import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_test_page/widgets/button.dart';
import 'package:responsive_test_page/widgets/display_lis_layout_desktop.dart';
import 'package:responsive_test_page/widgets/slider_options.dart';

class TestPageDeskTop extends StatefulWidget {
  const TestPageDeskTop({super.key});

  @override
  State<TestPageDeskTop> createState() => _TestPageDeskTopState();
}

class _TestPageDeskTopState extends State<TestPageDeskTop> {
  int index = 0;
  ScrollController scrollController = ScrollController();
  bool buttonVisible = false;

  static const List<DisplayListLayoutDesktop> displayList = [
    DisplayListLayoutDesktop(
      header: 'Drei einfache Schritte \nzu deinem neuen Job',
      images: ['assets/1_1.svg', 'assets/1_2.svg', 'assets/1_3.svg'],
      texts: [
        'Erstellen dein Lebenslauf',
        'Erstellen dein Lebenslauf',
        'Erstellen dein \nLebenslauf'
      ],
    ),
    DisplayListLayoutDesktop(
      header: 'Drei einfache Schritte \nzu deinem neuen Job',
      images: ['assets/2_1.svg', 'assets/2_2.svg', 'assets/2_3.svg'],
      texts: [
        'Erstellen dein Lebenslauf',
        'Erstellen dein Lebenslauf',
        'Erstellen dein \nLebenslauf'
      ],
    ),
    DisplayListLayoutDesktop(
      header: 'Drei einfache Schritte \nzu deinem neuen Job',
      images: ['assets/3_1.svg', 'assets/3_2.svg', 'assets/3_3.svg'],
      texts: [
        'Erstellen dein Lebenslauf',
        'Erstellen dein Lebenslauf',
        'Erstellen dein \nLebenslauf'
      ],
    )
  ];

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        if (buttonVisible)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                elevation: 0,
                backgroundColor: Colors.white,
                minimumSize: const Size(255, 40),
                side: const BorderSide(color: Color(0XFFCBD5E0), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Kostenlos Registrieren',
                style: TextStyle(
                  color: Color(0XFF319795),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Login',
            style: TextStyle(
              color: Color(0XFF319795),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >= 200 && buttonVisible == false) {
        setState(() {
          buttonVisible = true;
        });
      }
      if (scrollController.offset < 200 && buttonVisible == true) {
        setState(() {
          buttonVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - _appBar().toolbarHeight!,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: FractionalOffset.center,
                height: 500,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0XFFEBF4FF),
                      Color(0XFFE6FFFA),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Deine Job \nwebsite',
                          style: TextStyle(
                            fontSize: 65,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 320,
                          child: Button(),
                        ),
                      ],
                    ),
                    const SizedBox(width: 151),
                    CircleAvatar(
                      maxRadius: 230,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        'assets/undraw_agreement_aajr.svg',
                        width: 375,
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width,
                  alignment: FractionalOffset.center,
                  child: SliderOptions(
                    onPressed: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: displayList[index],
              )
            ],
          ),
        ),
      ),
    );
  }
}
