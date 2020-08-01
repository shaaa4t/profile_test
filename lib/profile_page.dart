import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: TheClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 190,
              left: 120,
              right: 120,
              //left: MediaQuery.of(context).size.width / 2,
              //width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/man.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Product Designer',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _card(
                      title: 'Joined Date',
                      sub: '1 January 2020',
                      icon: Icons.calendar_today,
                    ),
                    SizedBox(height: 16),
                    _card(
                      title: 'Active Projects',
                      sub: '13',
                      icon: Icons.done_all,
                    ),
                    SizedBox(height: 16),
                    _card(
                      title: 'Projects Delivered',
                      sub: '135',
                      icon: Icons.send,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _card({title,sub,icon}) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.green,
            size: 40,
          ),
          title: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 18),
          ),
          subtitle: Text(sub),
        ),
      ),
    );
  }
}

class TheClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 130);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
