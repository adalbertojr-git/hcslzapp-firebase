import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/controllers/app.controller.dart';
import 'package:hcslzapp/controllers/dashboard.controller.dart';
import 'package:hcslzapp/pages/about/about.page.dart';
import 'package:hcslzapp/pages/access.request/access.request.list.page.dart';
import 'package:hcslzapp/pages/associated/associated.list.page.dart';
import 'package:hcslzapp/pages/associated/associated.update.page.dart';
import 'package:hcslzapp/pages/boutique/boutique.list.page.dart';
import 'package:hcslzapp/pages/defect/defect.list.page.dart';
import 'package:hcslzapp/pages/digital.identity/digital.identity.page.dart';
import 'package:hcslzapp/pages/document/document.list.page.dart';
import 'package:hcslzapp/pages/dtc.code/dtc.code.access.page.dart';
import 'package:hcslzapp/pages/event/events.calendar.page.dart';
import 'package:hcslzapp/pages/financial/payment.list.page.dart';
import 'package:hcslzapp/pages/partnership/partnership.list.page.dart';
import 'package:hcslzapp/pages/ride/my.ride.page.dart';
import 'dart:io';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  final String _user;
  final String _firstName;
  final String _email;
  final int _associatedId;

  Dashboard(this._user, this._firstName, this._email, this._associatedId);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController _controller = DashboardController();

  BuildContext _gContext;

  List<String> _listAdmScreens = [
    "Associados",
    "Financeiro",
    "Eventos",
    "Parcerias",
    "Boutique",
  ];

  List<IconData> _listAdmIcons = [
    Icons.people_alt_rounded,
    Icons.monetization_on,
    Icons.event,
    Icons.emoji_people,
    Icons.wallet_giftcard,
  ];

  List<Widget> _listAdmWidgets = [
    AssociatedList(),
  ];

  @override
  void initState() {
    //_controller = Provider.of<AssociatedController>(context, listen: false);
    _controller.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _gContext = context;
    return Scaffold(
      drawer: drawr,
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get drawr => Drawer(
        child: ListView(
          children: <Widget>[
            Text(
              'Ladies Harley Club',
              textAlign: TextAlign.center,
            ),
            UserAccountsDrawerHeader(
              accountName: Text(
                this.widget._firstName,
              ),
              accountEmail: Text(this.widget._email),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/imgs/ladies.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre o HCSlz App"),
              onTap: () {
                Navigator.pop(_gContext);
              },
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Text('Tema Escuro:'),
                Container(
                  child: Switch(
                    activeColor: Colors.orangeAccent,
                    value: AppController.instance.isDarkTheme,
                    onChanged: (value) {
                      AppController.instance.changeTheme();
                    },
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(_gContext);
              },
            ),
          ],
        ),
      );

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.deepOrange[300]),
            //flex: 3,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 2,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            bar,
            grid,
          ],
        ),
      );

  get header => ListTile(
        contentPadding: EdgeInsets.only(left: 40, right: 20, top: 30),
        title: Text(
          this.widget._user == 'admin'
              ? 'Olá, Administrador'
              : 'Olá, ${this.widget._firstName}',
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        subtitle: Text(
          this.widget._email,
          style: TextStyle(color: Colors.white60),
        ),
        trailing: this.widget._user == 'admin'
            ? null
            : Observer(
                builder: (_) => CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  backgroundImage: PhotoImageProvider().getImageProvider(
                    File(
                      _controller.filePath != null
                          ? _controller.filePath
                          : 'assets/imgs/noImage.png',
                    ),
                  ),
                ),
              ),
      );

  get bar => (this.widget._user != 'admin'
      ? SizedBox()
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _BarButton(
              'Requisições de Acesso',
              Icons.send_to_mobile,
              onClick: () {
                Navigator.push(
                  _gContext,
                  MaterialPageRoute(
                      builder: (_gContext) => AccessRequestList()),
                );
              },
            ),
            _BarButton(
              'Documentos',
              Icons.file_copy_outlined,
              onClick: () {
                //_showContactsList(context);
              },
            ),
          ],
        ));

  get grid => (this.widget._user == 'admin' ? gridAdm : gridAssociated);

  get gridAssociated => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            //crossAxisSpacing: 10,
            //mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            children: <Widget>[
              _GridButton(
                title: "Associado",
                image: "assets/imgs/user.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(
                        builder: (gContext) =>
                            AssociatedUpdate(this.widget._associatedId)),
                  );
                },
              ),
              _GridButton(
                title: "Financeiro",
                image: "assets/imgs/financeiro.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(
                        builder: (gContext) =>
                            PaymentList(this.widget._associatedId)),
                  );
                },
              ),
              _GridButton(
                title: "Carteira Harley Club",
                image: "assets/imgs/carteirad.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(builder: (gContext) => DigitalIdentity()),
                  );
                },
              ),
              _GridButton(
                title: "Parcerias",
                image: "assets/imgs/parcerias.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(builder: (gContext) => PartnershipList()),
                  );
                },
              ),
              _GridButton(
                title: "Eventos",
                image: "assets/imgs/eventos.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(builder: (gContext) => EventCalendar()),
                  );
                },
              ),
/*
              GridButton(
                title: "Documentos",
                image: "assets/imgs/docs.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => DocumentList()),
                  );
                },
              ),
*/
              _GridButton(
                title: "Codigos DTC",
                image: "assets/imgs/codigosdtc.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(builder: (context) => DtcCodeAccess()),
                  );
                },
              ),
/*
              GridButton(
                title: "Oficina",
                image: "assets/imgs/oficina.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => DefectList()),
                  );
                },
              ),
*/
              _GridButton(
                title: "Boutique",
                image: "assets/imgs/boutique.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(builder: (gContext) => BoutiqueList()),
                  );
                },
              ),
/*
              GridButton(
                title: "Classificados",
                image: "assets/imgs/classificados.png",
                context: gContext,
                onClick: () {
*/
/*                            Navigator.push(
                              gContext,
                              MaterialPageRoute(
                                builder: (gContext) {
                                  return Classificados();
                                },
                              ),
                            );*/ /*

                },
              ),
*/
/*
              GridButton(
                title: "Meu Role",
                image: "assets/imgs/maps.png",
                context: gContext,
                onClick: () {
                  Navigator.push(
                    gContext,
                    MaterialPageRoute(builder: (gContext) => MyRide()),
                  );
                },
              ),
*/
              _GridButton(
                title: "O Harley Club",
                image: "assets/imgs/logo.png",
                context: _gContext,
                onClick: () {
                  Navigator.push(
                    _gContext,
                    MaterialPageRoute(builder: (gContext) => About()),
                  );
                },
              ),
            ],
          ),
        ),
      );

  get gridAdm => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: ListView.builder(
            itemCount: _listAdmScreens.length,
            itemBuilder: _listItem,
          ),
        ),
      );

  Widget _listItem(BuildContext context, int index) => Card(
        color: Colors.deepOrange[100],
        shadowColor: Colors.black,
        child: Column(
          children: <Widget>[
            ListTile(
/*              leading: Image.asset(
                "assets/imgs/logo.png",
                fit: BoxFit.fitHeight,
                width: 100.0,
              ), */
              leading: Icon(
                _listAdmIcons[index],
                size: 50,
              ),
              title: Text(
                _listAdmScreens[index],
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _listAdmScreens[index],
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
/*                Text(
                  'Population: 200}',
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),*/
                ],
              ),
              onTap: () {
                Navigator.push(
                  _gContext,
                  MaterialPageRoute(builder: (_gContext) => _listAdmWidgets[index]),
                );
              },
            )
          ],
        ),
      );
}

class _GridButton extends StatelessWidget {
  _GridButton({this.title, this.image, this.context, this.onClick});

  final String title;
  final String image;
  final BuildContext context;
  final Color color = Colors.white10;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: InkWell(
        onTap: () {
          onClick();
        },
        splashColor: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  } //build
} //GridButton

class _BarButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick; //callback

  _BarButton(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: Colors.deepOrange[100],
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 100,
            width: MediaQuery.of(context).size.width / 2 - 15,
            //width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.orange,
                  size: 50.0,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}