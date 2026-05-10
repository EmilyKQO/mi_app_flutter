import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ── Pantalla de inicio con navegación ──────────────────────────────────────

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi App Flutter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.flutter_dash, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 24),
            const Text(
              '¡Bienvenido!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explora las funciones básicas de Flutter',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            _BotonNavegar(
              label: 'Contador',
              icon: Icons.add_circle_outline,
              destino: const PantallaContador(),
            ),
            const SizedBox(height: 12),
            _BotonNavegar(
              label: 'Lista de tareas',
              icon: Icons.list_alt,
              destino: const PantallaLista(),
            ),
            const SizedBox(height: 12),
            _BotonNavegar(
              label: 'Mi perfil',
              icon: Icons.person_outline,
              destino: const PantallaPerfil(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonNavegar extends StatelessWidget {
  final String label;
  final IconData icon;
  final Widget destino;

  const _BotonNavegar({
    required this.label,
    required this.icon,
    required this.destino,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destino),
          );
        },
      ),
    );
  }
}

// ── Pantalla 1: Contador (StatefulWidget) ──────────────────────────────────

class PantallaContador extends StatefulWidget {
  const PantallaContador({super.key});

  @override
  State<PantallaContador> createState() => _PantallaContadorState();
}

class _PantallaContadorState extends State<PantallaContador> {
  int _contador = 0;

  void _incrementar() => setState(() => _contador++);
  void _decrementar() => setState(() => _contador--);
  void _reiniciar() => setState(() => _contador = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Valor actual:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            Text(
              '$_contador',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: _contador < 0
                    ? Colors.red
                    : _contador == 0
                        ? Colors.grey
                        : Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'dec',
                  onPressed: _decrementar,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 24),
                FloatingActionButton(
                  heroTag: 'inc',
                  onPressed: _incrementar,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: _reiniciar,
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Pantalla 2: Lista de tareas ────────────────────────────────────────────

class PantallaLista extends StatefulWidget {
  const PantallaLista({super.key});

  @override
  State<PantallaLista> createState() => _PantallaListaState();
}

class _PantallaListaState extends State<PantallaLista> {
  final List<_Tarea> _tareas = [
    _Tarea('Aprender Flutter'),
    _Tarea('Crear mi primera app'),
    _Tarea('Subir proyecto a GitHub'),
  ];

  final TextEditingController _ctrl = TextEditingController();

  void _agregarTarea() {
    final texto = _ctrl.text.trim();
    if (texto.isEmpty) return;
    setState(() => _tareas.add(_Tarea(texto)));
    _ctrl.clear();
  }

  void _toggleTarea(int i) {
    setState(() => _tareas[i].completada = !_tareas[i].completada);
  }

  void _eliminarTarea(int i) {
    setState(() => _tareas.removeAt(i));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pendientes = _tareas.where((t) => !t.completada).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Chip(label: Text('$pendientes pendientes')),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    decoration: const InputDecoration(
                      hintText: 'Nueva tarea...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _agregarTarea(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _agregarTarea,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: _tareas.isEmpty
                ? const Center(child: Text('No hay tareas. ¡Agrega una!'))
                : ListView.builder(
                    itemCount: _tareas.length,
                    itemBuilder: (context, i) {
                      final tarea = _tareas[i];
                      return ListTile(
                        leading: Checkbox(
                          value: tarea.completada,
                          onChanged: (_) => _toggleTarea(i),
                        ),
                        title: Text(
                          tarea.nombre,
                          style: TextStyle(
                            decoration: tarea.completada
                                ? TextDecoration.lineThrough
                                : null,
                            color: tarea.completada ? Colors.grey : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.red),
                          onPressed: () => _eliminarTarea(i),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _Tarea {
  String nombre;
  bool completada;
  _Tarea(this.nombre) : completada = false;
}

// ── Pantalla 3: Perfil (Card, CircleAvatar, StatelessWidget) ───────────────

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Estudiante de Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Taller de Desarrollo Móvil',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const _TarjetaInfo(
              icono: Icons.school,
              titulo: 'Tecnología',
              valor: 'Flutter 3 + Dart',
            ),
            const _TarjetaInfo(
              icono: Icons.code,
              titulo: 'Editor',
              valor: 'Visual Studio Code',
            ),
            const _TarjetaInfo(
              icono: Icons.star,
              titulo: 'Conceptos aprendidos',
              valor: 'Widgets, Estado, Navegación',
            ),
            const _TarjetaInfo(
              icono: Icons.favorite,
              titulo: 'Lo que más me gustó',
              valor: 'StatefulWidget y hot reload',
            ),
          ],
        ),
      ),
    );
  }
}

class _TarjetaInfo extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String valor;

  const _TarjetaInfo({
    required this.icono,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icono, color: Colors.deepPurple),
        title:
            Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(valor),
      ),
    );
  }
}
