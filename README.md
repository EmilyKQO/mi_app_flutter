# Mi App Flutter

Aplicación móvil desarrollada con **Flutter** y **Dart** como entregable individual del Taller de Desarrollo Móvil.

## Pantallas

| Pantalla | Descripción |
|---|---|
| Inicio | Menú principal con navegación a las 3 secciones |
| Contador | Incrementa, decrementa y reinicia un valor con `StatefulWidget` |
| Lista de tareas | Agrega, completa y elimina tareas con `ListView` |
| Perfil | Datos del estudiante con `Card` y `CircleAvatar` |

## Conceptos demostrados

- `StatelessWidget` y `StatefulWidget`
- Manejo de estado con `setState`
- Navegación entre pantallas con `Navigator.push`
- Widgets de layout: `Column`, `Row`, `Expanded`, `ListView.builder`
- Widgets de UI: `AppBar`, `Scaffold`, `Card`, `TextField`, `FloatingActionButton`
- Componentes reutilizables (widgets privados con `_`)

## Cómo correr el proyecto

```bash
# Instalar dependencias
flutter pub get

# Correr en Windows
flutter run -d windows

# Correr en Chrome
flutter run -d chrome

# Correr en Android (con emulador o dispositivo conectado)
flutter run -d android
```

## Requisitos

- Flutter 3.x
- Dart 3.x
- VS Code con extensión Flutter

## Tecnologías

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![VS Code](https://img.shields.io/badge/VS%20Code-Editor-007ACC?logo=visualstudiocode)

---

**Estudiante:** Emily Q  
**Institución:** Tecnológico de Monterrey  
**Materia:** Taller de Desarrollo Móvil
