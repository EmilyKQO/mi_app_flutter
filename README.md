# Mi App Flutter

Aplicación móvil desarrollada con **Flutter** y **Dart** como entregable individual del Taller de Desarrollo Móvil — Tecnológico de Monterrey.

---

## ¿Para qué sirve?

Esta app es una herramienta de productividad personal que combina tres funciones en una sola interfaz:

1. **Contador** — lleva el registro de cualquier cosa que necesites contar (repeticiones de ejercicio, puntos en un juego, inventario rápido, etc.).
2. **Lista de tareas** — organiza tus pendientes del día: agrega actividades, márcalas como completadas y elimina las que ya no necesitas.
3. **Perfil** — espacio donde el usuario puede ver un resumen de su información y las tecnologías con las que fue construida la app.

El objetivo principal es demostrar los conceptos fundamentales de Flutter dentro de una app cohesiva y funcional, no una colección de ejemplos aislados.

---

## ¿Cómo funciona?

### Flujo general

Al abrir la app el usuario ve la **Pantalla de Inicio**, desde donde puede navegar a cualquiera de las tres secciones usando los botones del menú. Cada pantalla tiene su propio `AppBar` con un botón de regreso para volver al inicio.

```
Pantalla de Inicio
    ├── Contador
    ├── Lista de tareas
    └── Perfil
```

### Pantalla de Inicio

Muestra el logo de Flutter, un mensaje de bienvenida y tres botones de navegación. Está construida con un `StatelessWidget` porque no necesita mantener ningún estado propio.

### Contador

- Muestra el número actual en grande al centro de la pantalla.
- El botón **`+`** suma 1 y el botón **`−`** resta 1 al valor.
- El botón **Reiniciar** regresa el contador a cero.
- El color del número cambia según el valor: morado (positivo), gris (cero), rojo (negativo).
- Usa `StatefulWidget` y `setState` para actualizar la interfaz cada vez que el valor cambia.

### Lista de tareas

- Viene precargada con 3 tareas de ejemplo.
- El campo de texto en la parte superior permite escribir una nueva tarea; se agrega presionando el botón `+` o la tecla Enter.
- Cada tarea tiene una casilla de verificación: al marcarla, el texto aparece tachado y en gris para indicar que está completada.
- El ícono de basura elimina la tarea de la lista.
- El `AppBar` muestra en tiempo real cuántas tareas siguen pendientes.
- Usa `ListView.builder` para renderizar la lista de forma eficiente y `TextEditingController` para leer el contenido del campo de texto.

### Perfil

- Muestra un avatar circular, el nombre del estudiante y la institución.
- Lista cuatro tarjetas con información: tecnología usada, editor, conceptos aprendidos y favorito del taller.
- Es un `StatelessWidget` porque sus datos son fijos.

---

## Conceptos de Flutter demostrados

| Concepto | Dónde se usa |
|---|---|
| `StatelessWidget` | Inicio, Perfil, widgets reutilizables |
| `StatefulWidget` + `setState` | Contador, Lista de tareas |
| `Navigator.push` | Navegación entre todas las pantallas |
| `ListView.builder` | Lista de tareas |
| `TextEditingController` | Campo de texto en Lista de tareas |
| Widgets de layout | `Column`, `Row`, `Expanded`, `SizedBox` |
| Widgets de UI | `AppBar`, `Card`, `Chip`, `FloatingActionButton`, `CircleAvatar` |
| Componentes reutilizables | `_BotonNavegar`, `_TarjetaInfo` |

---

## Cómo correr el proyecto

```bash
# Instalar dependencias
flutter pub get

# Correr en Windows
flutter run -d windows

# Correr en Chrome
flutter run -d chrome

# Correr en Android (emulador o dispositivo físico)
flutter run -d android
```

**Requisitos:** Flutter 3.x · Dart 3.x · VS Code con extensión Flutter

---

## Tecnologías

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![VS Code](https://img.shields.io/badge/VS%20Code-Editor-007ACC?logo=visualstudiocode)

---

**Estudiante:** Emily Q · `a01254256@tec.mx`  
**Institución:** Tecnológico de Monterrey  
**Materia:** Taller de Desarrollo Móvil
