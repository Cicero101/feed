import 'package:feed/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:feed/widgets/feed_card.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wakke Fun Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List users = [];

  var userIma = Image.asset("assets/images/icon_account.png",);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/json_wakkefun.json');
    final data = await json.decode(response);
    setState(() {
      users = data;
    });
  }
  
  initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset("assets/images/icon_header_menu.png",scale: 10/7,),
                    Image.asset("assets/images/logo_wakke_roxo.png",scale: 10/3.5,),
                    Image.asset("assets/images/icon_header_search.png",scale: 10/7,),
                  ],
                ),
              ),
            ],
          ),
        ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children:[ 
            Container(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/icon_header_menu2.png",),
                  Image.asset("assets/images/icon_add.png",),
                  Icon(Icons.add, color: Colors.transparent,),
                  Image.asset("assets/images/icon_account.png",),
                  Image.asset("assets/images/icon_notificacoes.png",),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children:[ 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
            child: Row(
              children: [
                Image.asset("assets/images/icon_chat.png",scale: 10/8,),
                Text(
                  ' Está acontecendo...',
                  style: TextStyle(
                    color: AppColors.roxo,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Scrollbar(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 34,),
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index){
                  if (users[index]["usuario_autor_imagem_perfil"] == null)
                    userIma =Image.asset("assets/images/icon_account.png",);
                  else
                    userIma = Image.network(users[index]["usuario_autor_imagem_perfil"],);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[             
                      FeedCardWidget(
                        nickname: users[index]["usuario_autor_nome"],
                        title: users[index]["titulo"],
                        image: Image.network(users[index]["imagem_capa"],),
                        userImage: (userIma),
                        nota: users[index]["media_nota"],
                        comentarios: users[index]["comentarios_qtd"],
                        onTap: () {},
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: Offset(0.0, 1.0),
                blurRadius: 18.0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(0.0, 10.0),
                blurRadius: 15.0,
              ),
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(0.0, 6.0),
                  blurRadius: 10.0,
                  spreadRadius: -1.0
              ),
            ],
          ),
          child: Center(
            child: Image.asset("assets/images/button_fun.png",),
          ),
        ),
      )
    );
  }
}
