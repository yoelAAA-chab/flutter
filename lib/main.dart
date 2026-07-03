import 'package:flutter/material.dart';
void main() {
  runApp(const MiApp());
}
class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'whatsApp',
      debugShowCheckedModeBanner: false,
      home: const WhatsAppScreen(), // primera pantalla que se muestra
    );
  }
}
class WhatsAppScreen extends StatefulWidget {
  const WhatsAppScreen({super.key});

  @override
  State<WhatsAppScreen> createState() => _WhatsAppScreenState();
}

























//este bloque esla parte de arriba doedne ta titulo y mas
class WhatsAppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WhatsAppAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+60);//este laine aumenta la altura de appvar de arriba asi no lo barra el otro


  //esto es lo se mostrara
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,//clor de fonode arriba del menu
      title: const Text(
        'WhatsApp',//este nombre aparecera en la pantalla ojo
        style: TextStyle(
          color: Color(0xFFC1C6C1),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      actions: const [
        IconButton(icon: Icon(Icons.camera_alt_outlined, color: Color.fromARGB(255, 255, 255, 255)), onPressed: null),//esta estan el nul porque no tiene auna parte propia 
        IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: null),
      ],

      //bara de bus
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100), // altura de la barra de búsqueda
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 10), // margen: izq arri bajo etc
          child: TextField(
            style: const TextStyle(color: Colors.white), // color del texto que escribes
            decoration: InputDecoration(
              hintText: 'Preguntar a Meta AI o buscar', // tesot que parece en el medio xd
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey), //un icino pero este apree en la isz
              filled: true, // permite pintar el fondo
              fillColor: const Color(0xFF1F2C34), //fond ela barra
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), // bordes 
                borderSide: BorderSide.none, // ya no hay lieas
              ),
            ),
          ),
        ),
      ),
      
    );
  }




}













//abajo pongo lo questa en body por que habra muvhas pantallas 












class _WhatsAppScreenState extends State<WhatsAppScreen> {
  int _indiceActual = 0;// esto es como ina list ej [pantalla0,tantalla1, pantalla2,y asi etc .]

  

  //ojoooooooooooooooooooooooo  aqui si ose tengo que poner los itnems que hay 
  final List<Widget> _pantallas = const [
    ChatsPage(),
    Center(child: Text('Próximamente: Estados')),
    Center(child: Text('Próximamente: grupos')),  
    LlamadasPage(),
  ];
  //muy importanteeeee ejemplo yo puse 2 pestañas pero enrelidas hay 4 items abjo por lo cual 
  //y poner en ored muy importante ya que si nos nopra diferciarse ojoooooooooooooooooooooooooo



  //el que intecabia de pantalla
  void _cambiarPestana(int nuevoIndice) {//este bleque los que hace es que le das toque y va a la pestaña que le diste estos esta en la parte de abajo osea el menu 
    setState(() {
      _indiceActual = nuevoIndice; //esto como es funcion 
    });
  }







  //esto se most
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 1, 16),//color de la pantalla de medio 
      appBar: const WhatsAppAppBar(),
      body: _pantallas[_indiceActual], // muestra la pantalla del pan actual
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),//color de navbar de abajo 
        currentIndex: _indiceActual, // este es con quies esta primero (OJOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO    ACtUAL)
        selectedItemColor: const Color(0xFF25D366), //color de icono que apare abajo
        unselectedItemColor: const Color.fromARGB(179, 243, 243, 243), //de este color se pine el icono que no esya activo
        onTap: _cambiarPestana,  //funcion muy important (puede ser null esot pero no llama a nadie si es null solo manjear como prac)
        type: BottomNavigationBarType.fixed,//esta propiedas dice que sirve para que funcione el backgron si tienes tres items o menos se mantendra el color de bacgron pero si se supera mas de 3 usar esta funcion que respeta el color OJO


        items: const [ //aui pones los ico
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label:'estados'),
          BottomNavigationBarItem(icon: Icon(Icons.groups_3), label:'Grupos'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Llamadas'),
        ],


      ),
    );
  }





}

























//etsas seran las pantalals que s emostraran a qui se desicde cuantas hay se hara dos de pruba mas si es que puede estaran al final


//PANTALLA O
class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});



  @override
  Widget build(BuildContext context) {
  

    
    return ListView(
      
      children: const [
        ChatTile(nombre: '+591 7383122', ultimoMensaje: 'xdddd ', hora: '12:34', urlImagen: 'lib/img/foto1.jpg'),
        //Divider(height: 1, color: Colors.white10),
        ChatTile(nombre: 'grupo de programacion 3', ultimoMensaje: 'hola bro como esats', hora: '11:05',urlImagen: 'lib/img/foto2.jpg', ),
        ChatTile(nombre: '+591 123345', ultimoMensaje: '', hora: 'Ayer', urlImagen: 'lib/img/foto9.jpg'),
        ChatTile(nombre: '+591 123344', ultimoMensaje: 'ya comenzaran las clases ', hora: 'Lunes', urlImagen: 'lib/img/foto3.jpg'),
        ChatTile(nombre: '+591 7383122', ultimoMensaje: 'gracias ing por las clases xd estubo good ', hora: '12:34', urlImagen: 'lib/img/foto4.jpg'),
        ChatTile(nombre: 'grupo de programacion 3', ultimoMensaje: '+591 6646347 : stiker', hora: '11:05', urlImagen: 'lib/img/foto5.jpg',),
        ChatTile(nombre: '+591 123345', ultimoMensaje: 'donde estas?', hora: 'Ayer', urlImagen: 'lib/img/foto6.jpg',),

        ChatTile(nombre: '+591 123344', ultimoMensaje: 'jgamos xddd?', hora: 'Lunes', urlImagen: 'lib/img/foto7.jpg'),

        ChatTile(nombre: '+591 123345', ultimoMensaje: 'donde estas?', hora: 'Ayer', urlImagen: 'lib/img/foto8.jpg'),
        ChatTile(nombre: '+591 123345', ultimoMensaje: 'donde estas?', hora: 'Ayer', urlImagen: 'lib/img/foto9.jpg'),
      ],
    );
  }



}








//pantalla 4 esla de llamadas no puse las demas 2 de abajo solo del navbar


class LlamadasPage extends StatelessWidget {
  const LlamadasPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: const [
        LlamadaTile(nombre: 'bro', cuando: 'Hoy, 08:30',  urlImagen: 'lib/img/foto9.jpg'),
        LlamadaTile(nombre: 'papa', cuando: 'Hoy, 07:15', urlImagen: 'lib/img/foto8.jpg'),
        LlamadaTile(nombre: 'mama', cuando: 'Ayer, 18:22',  urlImagen: 'lib/img/foto7.jpg'),
        LlamadaTile(nombre: 'hermana', cuando: 'Ayer, 15:00',urlImagen: 'lib/img/foto6.jpg'),
        LlamadaTile(nombre: 'bro', cuando: 'Hoy, 08:30',  urlImagen: 'lib/img/foto9.jpg'),
        LlamadaTile(nombre: 'papa', cuando: 'Hoy, 07:15', urlImagen: 'lib/img/foto5.jpg'),
        LlamadaTile(nombre: 'mama', cuando: 'Ayer, 18:22',urlImagen: 'lib/img/foto4.jpg'),
        LlamadaTile(nombre: 'hermana', cuando: 'Ayer, 15:00', urlImagen: 'lib/img/foto3.jpg'),
        LlamadaTile(nombre: 'papa', cuando: 'Hoy, 07:15', urlImagen: 'lib/img/foto2.jpg'),
        LlamadaTile(nombre: 'mama', cuando: 'Ayer, 18:22', urlImagen: 'lib/img/foto1.jpg'),
        LlamadaTile(nombre: 'hermana', cuando: 'Ayer, 15:00',  urlImagen: 'lib/img/foto3.jpg'),
      ],
    );
  }
}



















































//esta parte es como se arma la pantalla de cada seccion ejmplo la parte de mensajes 
//cuando envia mensajes se meutra la foto de perfil al lado y el num al lado etc esto es como se harma cada cosa
//y como se hace eso por que ej ChatTile(nombre: '+591 123345', ultimoMensaje: 'donde estas?', hora: 'Ayer', colorAvatar: Colors.orange),
//                       ahi dice Chattile asis e concta como herencia 
class ChatTile extends StatelessWidget {
  final String nombre;
  final String ultimoMensaje;
  final String hora;
  final String? urlImagen;

  const ChatTile({
    super.key,
    required this.nombre,
    required this.ultimoMensaje,
    required this.hora,
    this.urlImagen,
  });

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
      
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: const Color.fromARGB(255, 228, 228, 228), 
        // Si urlImagen es nulo o vacío usa una por defecto, si tiene ruta usa esa
        backgroundImage: AssetImage(urlImagen != null && urlImagen!.isNotEmpty ? urlImagen! : 'lib/img/default.png'),
      ),
      
      title: Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
      subtitle: Text(ultimoMensaje),
      trailing: Text(hora, style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      onTap: () {
        print('Entrando al chat de $nombre...');
      },
    );
  }
}









//esto es como se 

class LlamadaTile extends StatelessWidget {
  final String nombre;
  final String cuando;
  final String? urlImagen;

  const LlamadaTile({
    super.key,
    required this.nombre,
    required this.cuando,
    this.urlImagen,
  });

  @override
  Widget build(BuildContext context) {
    // Elegir ícono y color según el tipo de llamada




    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: const Color.fromARGB(255, 228, 228, 228), 
        // Si urlImagen es nulo o vacío usa una por defecto, si tiene ruta usa esa
        backgroundImage: AssetImage(urlImagen != null && urlImagen!.isNotEmpty ? urlImagen! : 'lib/img/default.png'),
      ),
      title: Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),

      trailing: IconButton(
        icon: const Icon(Icons.call_outlined, color: Color.fromARGB(255, 234, 234, 234)),

        onPressed: () {
          print('Llamando a $nombre...');
        },
      ),
      subtitle: Text(
        nombre+' llamada',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}