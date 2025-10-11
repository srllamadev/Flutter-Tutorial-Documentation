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
  //Esto no se puede por que es -final- osea solo una vez le podemos dar el dato
  //final myName2 = 'aaaa';
  //myName2 = 'bbbb';

  print('Hola $myName2');
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
