import 'package:feed/themes/app_colors.dart';
import 'package:flutter/material.dart';

class FeedCardWidget extends StatelessWidget {
  final String nickname;
  final String title;
  final int nota;
  final Image userImage;
  final Image image;
  final int comentarios;
  final onTap;

  const FeedCardWidget({
    Key? key,
    required this.nickname,
    required this.title,
    required this.comentarios,
    required this.nota,
    required this.userImage,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Flex(
        mainAxisSize: MainAxisSize.min,
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 4.0),
          ),
          Card(
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              width: double.infinity,
              child: Column(
                children:[
                  Stack(
                    children:[ 
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              child: userImage,
                            ),
                            Text(
                              nickname,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/images/icon_coments.png",scale: 3/2,),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 4,bottom: 4),
                            child: Text(
                              "$comentarios",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Image.asset("assets/images/icon_star.png",scale: 3/2,),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, top: 4,bottom: 4),
                            child: Text(
                              "$nota.0",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: image
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: AppColors.turquesa,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "$title",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
