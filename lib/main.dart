import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electricity clone',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Saldo",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.green.shade900),
        ),
        endDrawer: const CustomEndDrawer(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: "Alias - Número de servicio",
                      border: InputBorder.none,
                    ),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(8.0),
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Text("limo     - 0101          4"),
                      ),
                    ],
                    value: 1,
                    onChanged: (value) {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      const ColonTextInfo(
                        beforeColon: "Periodo",
                        afterColon: "Enero - Marzo 2023",
                      ),
                      const ColonTextInfo(
                        beforeColon: "Fecha límite de pago",
                        afterColon: "21/Marzo/2023",
                      ),
                      ColonTextInfo(
                        beforeColon: "Estatus",
                        afterColon: "Pagado",
                        afterColonColor: Colors.green.shade800,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Saldo actual:",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "\$0",
                            style: TextStyle(
                              fontSize: 52.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "317 kWh ",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                TextSpan(
                                  text: "consumo ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                const TextSpan(
                                  text: "Medio",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 12,
                            margin: const EdgeInsets.only(top: 20.0),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.green,
                                  Colors.yellow,
                                  Colors.orange,
                                  Colors.red,
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      color: Colors.green.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Pagar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Colors.green.shade800,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.ssid_chart_sharp,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        "Simula tu consumo",
                        style: TextStyle(
                          color: Colors.green.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
      ),
    );
  }
}

class ColonTextInfo extends StatelessWidget {
  const ColonTextInfo({
    super.key,
    required this.beforeColon,
    required this.afterColon,
    this.afterColonColor,
  });

  final String beforeColon;
  final String afterColon;
  final Color? afterColonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$beforeColon: ",
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
            TextSpan(
              text: afterColon,
              style: TextStyle(
                color: afterColonColor ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Menú",
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const DrawerItem(
            text: "Mi perfil",
            icon: Icons.person_outline,
          ),
          const DrawerItem(
            text: "Números de servicio",
            icon: Icons.format_list_numbered,
          ),
          const DrawerItem(
            text: "Tarjetas",
            icon: Icons.credit_card,
          ),
          const DrawerItem(
            text: "Paperless",
            icon: Icons.eco_outlined,
          ),
          const DrawerItem(
            text: "Centro de mensajes",
            icon: Icons.notifications_none_outlined,
          ),
          const DrawerItem(
            text: "Cambiar contraseña",
            icon: Icons.lock_outline_rounded,
          ),
          const DrawerItem(
            text: "¿Cómo contratar?",
            icon: Icons.lightbulb_outlined,
          ),
          const DrawerItem(
            text: "Tutorial",
            icon: Icons.play_arrow_outlined,
          ),
          const DrawerItem(
            text: "Aviso de privacidad",
            icon: Icons.privacy_tip_outlined,
          ),
          const DrawerItem(
            text: "Cerrar sesión",
            icon: Icons.logout_rounded,
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.green.shade800,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: Colors.green.shade800,
          width: 0.5,
        ),
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Saldo",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_rounded),
          label: "Recibos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.electric_meter_outlined),
          label: "Reportes",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: "Ubícanos",
        ),
      ],
    );
  }
}
