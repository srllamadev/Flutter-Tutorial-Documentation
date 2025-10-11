# Documentación: Tipos de Datos en Flutter/Dart

Flutter utiliza el lenguaje de programación **Dart**, por lo que los tipos de datos que se usan son los mismos que en Dart. Aquí tienes una guía completa sobre los tipos de datos disponibles:

## 1. Tipos de Datos Básicos (Primitivos)

### **Números (Numbers)**

```dart
// Enteros (int)
int edad = 25;
int cantidad = -10;

// Números de punto flotante (double)
double precio = 19.99;
double temperatura = -5.5;

// Se puede usar num para ambos tipos
num numero = 10;
numero = 10.5;
```

### **Cadenas (Strings)**

```dart
String nombre = 'Juan';
String apellido = "Pérez";
String mensaje = '''
Este es un
texto multilínea
''';

// Interpolación de strings
String saludo = 'Hola $nombre ${apellido.toUpperCase()}';
```

### **Booleanos (Booleans)**

```dart
bool esMayor = true;
bool tieneHijos = false;
bool esVisible = (edad > 18);
```

## 2. Tipos de Datos Colecciones

### **Listas (Lists)**

```dart
// Lista de enteros
List<int> numeros = [1, 2, 3, 4, 5];

// Lista dinámica
List<dynamic> mixto = [1, 'hola', true, 3.14];

// Lista vacía
List<String> nombres = [];

// Métodos comunes
numeros.add(6);
numeros.remove(3);
print(numeros.length);
print(numeros[0]);
```

### **Sets**

```dart
// Conjunto de elementos únicos
Set<int> conjunto = {1, 2, 3, 3, 4}; // {1, 2, 3, 4}
Set<String> colores = {'rojo', 'verde', 'azul'};

// Métodos útiles
conjunto.add(5);
conjunto.contains(2);
```

### **Mapas (Maps)**

```dart
// Mapa clave-valor
Map<String, dynamic> persona = {
  'nombre': 'María',
  'edad': 30,
  'casado': false
};

Map<int, String> estudiantes = {
  1: 'Carlos',
  2: 'Ana',
  3: 'Luis'
};

// Acceso a valores
print(persona['nombre']); // María
persona['edad'] = 31;
```

## 3. Tipos Especiales

### **Dynamic**

```dart
// Permite cualquier tipo de dato
dynamic variable = 10;
variable = 'Ahora soy string';
variable = true;
```

### **Var**

```dart
// Tipo inferido por el compilador
var numero = 10; // int
var texto = 'Hola'; // String
var lista = [1, 2, 3]; // List<int>
```

### **Final y Const**

```dart
// Final - asignación única en tiempo de ejecución
final String nombreFinal = 'Juan';
final DateTime ahora = DateTime.now();

// Const - constante en tiempo de compilación
const double PI = 3.1416;
const int horasDia = 24;
```

## 4. Tipos de Datos en Flutter (Específicos del Framework)

### **Widgets**

```dart
// Widgets comunes con sus tipos
Text('Hola Mundo', style: TextStyle(fontSize: 16));
Container(
  width: 100.0,
  height: 50.0,
  color: Colors.blue,
);
Column(
  children: <Widget>[
    Text('Elemento 1'),
    Text('Elemento 2'),
  ],
);
```

### **Tipos de Datos para UI**

```dart
// Color
Color colorPrimario = Colors.blue;
Color colorPersonalizado = Color(0xFF42A5F5);

// TextStyle
TextStyle estiloTexto = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

// EdgeInsets
EdgeInsets margen = EdgeInsets.all(16.0);
EdgeInsets padding = EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
```

### **Async Types**

```dart
// Future
Future<String> obtenerDatos() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Datos cargados';
}

// Stream
Stream<int> contador() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
```

## 5. Null Safety

```dart
// Variables no nulas por defecto
String nombre = 'Juan'; // No puede ser null

// Variables nulables
String? apellido = null; // Puede ser null
int? edad = null;

// Operador de acceso seguro
int? longitud = apellido?.length;

// Operador de coalescencia nula
String nombreCompleto = nombre ?? 'Invitado';
int edadSegura = edad ?? 0;
```

## 6. Enumeraciones (Enums)

```dart
enum Estado { cargando, completado, error }
enum TipoUsuario { administrador, usuario, invitado }

Estado estadoActual = Estado.cargando;

void cambiarEstado(Estado nuevoEstado) {
  estadoActual = nuevoEstado;
}
```

## 7. Clases y Objetos

```dart
class Persona {
  String nombre;
  int edad;
  
  Persona(this.nombre, this.edad);
  
  void presentarse() {
    print('Hola, soy $nombre y tengo $edad años');
  }
}

// Uso
Persona persona = Persona('Ana', 25);
persona.presentarse();
```

## 8. Funciones como Tipos de Datos

```dart
// Función como tipo
int Function(int, int) sumar = (a, b) => a + b;

// Función que recibe función como parámetro
void ejecutarOperacion(int a, int b, int Function(int, int) operacion) {
  print(operacion(a, b));
}
```

## Ejemplo Práctico en Flutter

```dart
import 'package:flutter/material.dart';

class MiWidget extends StatelessWidget {
  final String titulo; // String
  final int contador; // int
  final bool activo; // bool
  final List<String> items; // List
  final Map<String, dynamic> configuracion; // Map
  final VoidCallback onPressed; // Function

  const MiWidget({
    Key? key,
    required this.titulo,
    required this.contador,
    required this.activo,
    required this.items,
    required this.configuracion,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // EdgeInsets
      color: activo ? Colors.blue : Colors.grey, // Color y bool
      child: Column(
        children: [
          Text(titulo, style: const TextStyle(fontSize: 20)), // String y TextStyle
          Text('Contador: $contador'), // int interpolado
          ...items.map((item) => Text(item)).toList(), // List iterada
          ElevatedButton(
            onPressed: onPressed, // Function
            child: const Text('Presionar'),
          ),
        ],
      ),
    );
  }
}
```

## Resumen de Tipos de Datos

| Tipo | Descripción | Ejemplo |
|------|-------------|---------|
| `int` | Números enteros | `int edad = 25` |
| `double` | Números decimales | `double precio = 19.99` |
| `String` | Cadenas de texto | `String nombre = 'Juan'` |
| `bool` | Valores booleanos | `bool activo = true` |
| `List` | Colecciones ordenadas | `List<int> numeros = [1, 2, 3]` |
| `Set` | Colecciones únicas | `Set<String> colores = {'rojo', 'azul'}` |
| `Map` | Pares clave-valor | `Map<String, int> edades = {'Juan': 25}` |
| `dynamic` | Tipo dinámico | `dynamic variable = 10` |
| `var` | Tipo inferido | `var texto = 'hola'` |

Esta documentación cubre los tipos de datos fundamentales que necesitarás al desarrollar aplicaciones en Flutter con Dart.