import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationView extends StatefulWidget {
  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  Position _currentPosition;
  String _currentAdress;

  @override
  void initState() {
    super.initState();

    _getAddressFromLatLng();
  }

  _getAddressFromLatLng() async {
    try {
      this._currentPosition =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      _currentAdress =
          "${place.street}, ${place.subThoroughfare}, ${place.postalCode}, ${place.subLocality} - ${place.subAdministrativeArea}";

      setState(() => {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.78,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                  child: Text(
                    'De onde você está falando?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Image(
                image: AssetImage('assets/small/robot.png'),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(21),
              border: Border.all(color: Theme.of(context).cardColor, width: 8),
            ),
            child: Column(
              children: [
                _currentAdress != null
                    ? gps(_currentAdress)
                    : Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: CircularProgressIndicator()),
                      ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 20),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/options');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            'Continuar',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        ),
                      )),
                ),
                btnTentarNovamente(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding btnTentarNovamente(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 40),
      child: FlatButton(
          onPressed: () {
            _getAddressFromLatLng();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(21),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                'Tentar Novamente',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          )),
    );
  }

  Widget gps(address) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Text(
        'Segundo sua localização, você está em ' + address + ', certo?',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
