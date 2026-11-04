{4. Se desea ordenar en memoria una secuencia de 2.500 nombres de ciudades de longitud máxima 50 
que se leen de teclado.
a) Defina una estructura de datos estática que le permita guardar la misma información leída. Calcule 
su tamaño de memoria.
b) En versiones antiguas de Pascal no era posible manejar estructuras de datos estáticas que superen 
los 64 Kb. Por este motivo cuando los datos a almacenar superaban este límite se debían utilizar 
estructuras dinámicas basadas en punteros. Si tuviéramos esta limitación para resolver a) deberíamos 
utilizar un vector de punteros a palabras, como se indica en la siguiente estructura:

Type 
  NombreCiudad = String[50];
  PtrNombreCiudad = ^ NombreCiudad;
  PtrNombreCiudades = array[1..2500] of PtrNombreCiudad;
Var  
  Punteros: PtrNombreCiudades;

b.1.) Indique cuál es el tamaño de la variable Punteros al comenzar el programa
b.2.) Escriba un módulo que permita reservar memoria una cantidad de nombres dada (máximo 2.500). 
¿Cuál es la cantidad de memoria reservada después de ejecutar el módulo para X cantidad de ciudades?
b.3.) Escriba un módulo para leer los nombres y colocarlos en la variable Punteros.}

{==============================================================================
 RESPUESTAS TEÓRICAS Y CÁLCULOS:
 ==============================================================================

 a) Estructura estática:
    type
      CiudadesEstaticas = array[1..2500] of string[50];

    Cálculo de tamaño:
    - Cada string[50] ocupa 51 bytes (50 caracteres + 1 byte de longitud).
    - 2500 elementos * 51 bytes = 127.500 bytes (~124.5 KB).
    - Conclusión: 127.500 bytes excede el límite de 64 KB (65.536 bytes) de
      memoria estática en compiladores antiguos de Pascal.

 b.1) Tamaño de la variable Punteros al comenzar el programa:
    - Punteros es un arreglo estático de 2500 punteros.
    - Cada puntero ocupa 4 bytes.
    - 2500 * 4 bytes = 10.000 bytes (~9.76 KB).
    - Conclusión: Al inicio, solo ocupa 10.000 bytes en memoria estática
      (entra perfectamente en el límite de 64 KB).

 b.2) Memoria reservada para X ciudades:
    - Cada llamada a new(p[i]) reserva en el Heap un bloque de tipo NombreCiudad (51 bytes).
    - Memoria dinámica (Heap) reservada: X * 51 bytes.
    - Memoria total en uso por el programa: 10.000 bytes (estáticos) + (X * 51 bytes en Heap).
 ==============================================================================}

program modulo8practica4;

const
  MAX_CIUDADES = 2500;

type
  NombreCiudad = string[50];
  PtrNombreCiudad = ^NombreCiudad;
  PtrNombreCiudades = array[1..MAX_CIUDADES] of PtrNombreCiudad;

// b.2) Módulo para reservar memoria para X ciudades
procedure reservarMemoria(var p: PtrNombreCiudades; x: integer);
var
  i: integer;
begin
  if (x >= 1) and (x <= MAX_CIUDADES) then begin
    for i := 1 to x do
      new(p[i]);
  end;
end;

// b.3) Módulo para leer los nombres de las ciudades
procedure leerNombres(var p: PtrNombreCiudades; x: integer);
var
  i: integer;
begin
  if (x >= 1) and (x <= MAX_CIUDADES) then begin
    for i := 1 to x do begin
      writeln('Ingrese el nombre de la ciudad ', i, ':');
      readln(p[i]^);
    end;
  end;
end;

// Módulo de liberación para buenas prácticas de memoria
procedure liberarMemoria(var p: PtrNombreCiudades; x: integer);
var
  i: integer;
begin
  if (x >= 1) and (x <= MAX_CIUDADES) then begin
    for i := 1 to x do begin
      dispose(p[i]);
      p[i] := nil;
    end;
  end;
end;

var
  Punteros: PtrNombreCiudades;
  cant: integer;

begin
  cant := 5; // Cantidad de prueba
  reservarMemoria(Punteros, cant);
  // leerNombres(Punteros, cant);
  liberarMemoria(Punteros, cant);
end.
