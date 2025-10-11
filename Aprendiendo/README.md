# Documentación de Dart
## Ejemplo 1 - Hola Mundo
```dart
void main() {
  var myName = 'Hola';


  print('Mundo $myName');
}
```
```bash
Mundo Hola
```
---
## Ejemplo 2 - String
```dart
void main() {
  //comentario
  var myName = 'Hola';
  String myName1 = 'asd';

  print('Mundo $myName');
  print('$myName1');
}
```
```bash
Mundo Hola
asd
```
---
## Ejemplo 3 - late y final
```dart
void main() {
  final myName2 = 'aaaa';
  //Esto no se puede por que es -final- osea solo una vez le podemos dar el dato
  //myName2 = 'bbbb';
  print('Hola $myName2');
  //Una vez que se le asigna un valor a una variable final, ese valor no puede ser 
  //cambiado ni reasignado durante la ejecución del programa.
}

```
```bash
Hola aaaa
```
---
## Ejemplo 4 - Const
```dart
void main() {
  const myName = 'cccc';

  print('Hola $myName');
  print('Hola ${myName.toUpperCase()}');
  print('Hola ${1 + 1}');
}
```
```bash
Hola cccc
Hola CCCC
Hola 2
```
---
## Ejemplo 5 - Tipos de datos
```dart
void main() {
  final String pokemon = 'Ditto';
  final int hp = 100;
  final isAlive = true;
  //otra forma
  //final abilities = <String> ['impostor'];
  final List<String> abilities = ['impostor'];
  final sprites = <String>['ditto/front.png','ditto/back.png'];

  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  """);
}
```
```bash
  Ditto
  100
  true
  [impostor]
  [ditto/front.png, ditto/back.png]
``` 