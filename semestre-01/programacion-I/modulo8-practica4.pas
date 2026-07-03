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

program modulo8practica4;

type

  ciudad = string[50];

  ptrCiudad = ^ciudad;

  ciudades = array[1..2500] of ptrCiudad;

procedure reservarMemoria(var C: ciudades; x: integer);
  var
    i: integer;
  begin

    for i := 1 to x do begin
      new(C[i]);
    end;
  end;
      
procedure cargarCiudades(var C: ciudades; x: integer);
  var
    i: integer;
  begin

    for i := 1 to x do begin
      writeln('nombre de ciudad', i);
      readln(C[i]^);
    end;
  end;

procedure liberarMemoria(var C: ciudades; x: integer);
  var
    i: integer;
  begin
    for i := 1 to x do begin
      dispose(C[i]);
    end;
  end;

var
  ciud: ciudades;
  a: integer;
begin
  writeln('Ingrese un numero');
  readln(a);
  reservarMemoria(ciud, a);
  cargarCiudades(ciud, a);
  liberarMemoria(ciud, a);
  readln;
end.