import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:ui_netflix/models/content_model.dart';

class Preview extends StatelessWidget {
  const Preview({
    Key? key,
    this.title = '',
    this.contentList = const [],
  }) : super(key: key);
  final String title;
  final List<Content> contentList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(
          height: 165.0,
          // Enable Scroll Darg on The Web
          child: ListView.builder(
            itemCount: contentList.length,
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            itemBuilder: (BuildContext context, int index) {
              final content = contentList[index];
              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: content.color!,
                          width: 5.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            Colors.transparent,
                          ],
                          stops: [0, 0.25, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: content.color!,
                          width: 5.0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: SizedBox(
                        height: 60.0,
                        child: Image.asset(content.titleImageUrl!),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
