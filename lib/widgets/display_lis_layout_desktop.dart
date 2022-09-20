import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DisplayListLayoutDesktop extends StatelessWidget {
  final String header;
  final List<String> texts;
  final List<String> images;

  const DisplayListLayoutDesktop({
    super.key,
    required this.images,
    required this.texts,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 40),
          Text(
            header,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0XFF4A5568),
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '1.',
                style: TextStyle(
                  fontSize: 130,
                  color: Color(0XFF718096),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                texts[0],
                style: const TextStyle(
                  color: Color(0XFF718096),
                ),
              ),
              const SizedBox(width: 60),
              SvgPicture.asset(images[0]),
            ],
          ),
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(images[1]),
              SizedBox(width: 60),
              const Text(
                '2.',
                style: TextStyle(
                  fontSize: 130,
                  color: Color(0XFF718096),
                ),
              ),
              Text(
                texts[1],
                style: const TextStyle(
                  color: Color(0XFF718096),
                ),
              )
            ],
          ),
          const SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '3.',
                style: TextStyle(
                  fontSize: 130,
                  color: Color(0XFF718096),
                ),
              ),
              Text(
                texts[2],
                style: const TextStyle(
                  color: Color(0XFF718096),
                ),
              ),
              SizedBox(width: 60),
              SvgPicture.asset(images[2]),
            ],
          )
        ],
      ),
    );
  }
}
