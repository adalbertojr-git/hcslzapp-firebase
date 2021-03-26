import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'dart:math';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/partnership.list.controller.dart';
import 'package:hcslzapp/models/partnership.dart';

const SCALE_FRACTION = 0.7;
const FULL_SCALE = 1.0;
const PAGER_HEIGHT = 200.0;

class PartnershipListPage extends StatefulWidget {
  final String _user;

  PartnershipListPage(this._user);

  @override
  _PartnershipListPageState createState() => _PartnershipListPageState();
}

class _PartnershipListPageState extends State<PartnershipListPage> {
  PartnershipListController _controller = PartnershipListController();
  double viewPortFraction = 0.5;
  PageController pageController;
  int currentPage = 0;
  List<Map<String, String>> listOfCharacters = [
    {'image': "assets/richmond.png", 'name': "Richmond"},
    {'image': "assets/roy.png", 'name': "Roy"},
    {'image': "assets/moss.png", 'name': "Moss"},
    {'image': "assets/douglas.png", 'name': "Douglas"},
    {'image': "assets/jen.png", 'name': "Jen"}
  ];
  double page = 0.0;

  @override
  void initState() {
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
    _controller.getFuture().then((value) {
      if (value != null && value.isNotEmpty) {
        _controller.setButtonVisibilty();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
          body: FutureBuilder<List<Partnership>>(
            future: _controller.future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                case ConnectionState.active:
                  break;
                default:
                  if (snapshot.hasError) {
                    return CenteredMessage(snapshot.error.toString());
                  } else {
                    if (snapshot.data == null)
                      return CenteredMessage(
                        _controller.errorMsg,
                      );
                    if (snapshot.data.length > 0) {
                      _controller.init;
                      _controller.partnerships.addAll(snapshot.data);
                      return _widgets();
                    } else
                      return CenteredMessage(
                        'Não existem parcerias cadastradas.',
                      );
                  }
              } //switch (snapshot.connectionState)
              return CenteredMessage(
                'Houve um erro desconhecido ao executar a transação.',
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: _controller.isHidedButton
              ? null
              : Button(
                  icon: Icons.arrow_back,
                  onClick: () => Navigator.of(context).pop()),
        ),
      );

  _widgets() => Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            TopMargin(),
            Container(
              height: PAGER_HEIGHT,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    setState(() {
                      page = pageController.page;
                    });
                  }
                },
                child: PageView.builder(
                  onPageChanged: (pos) {
                    setState(() {
                      currentPage = pos;
                    });
                  },
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  itemCount: _controller.partnerships.length,//listOfCharacters.length,
                  itemBuilder: (context, index) {
                    final scale = max(SCALE_FRACTION,
                        (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                    return circleOffer(listOfCharacters[index]['image'], scale);
                    //return circleOffer(_controller.partnerships[index]['image'], scale);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                //listOfCharacters[currentPage]['name'],
                _controller.partnerships[currentPage].partner,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            buildDetail()
          ],
        ),
      );

  Widget circleOffer(String image, double scale) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: PAGER_HEIGHT * scale,
          width: PAGER_HEIGHT * scale,
          child: Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias,
            shape: CircleBorder(
                side: BorderSide(color: Colors.grey.shade200, width: 5)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget buildDetail() => Container(
        color: Colors.black26,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildUserInfo(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: Text(
                'Creates insets with symmetrical vertical and horizontal offsets.' *
                    20,
                style: TextStyle(
                  color: Colors.black,
                  height: 1.4,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildUserInfo() => ListTile(
        //title: Text(listOfCharacters[currentPage]['name']),
        title: Text(_controller.partnerships[currentPage].partner),
        subtitle: Text('owl'),
      );
}
