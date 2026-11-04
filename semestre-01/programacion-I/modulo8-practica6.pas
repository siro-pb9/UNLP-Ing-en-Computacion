{6. Una imagen puede representarse como una matriz de puntos (píxeles) donde para cada uno de ellos 
se debe indicar su tono de gris. Dicho tono es un número entre 0 y 255, donde 0 representa negro, 
255 blanco y los valores intermedios dan el tono de gris correspondiente.
Como las imágenes ocupan un gran espacio de memoria, se pensó en usar una estructura como la siguiente:
Estamos trabajando con un monitor que tiene una resolución de 480x640 píxeles (o puntos).
a) Defina la estructura de datos correspondiente.
b) Calcule el tamaño de la estructura al momento de comenzar el programa. 
c) Escriba un módulo que le permita ingresar las primeras 100 filas de la pantalla (no olvide que cada 
fila está formada por 640 puntos). Indique el tamaño de la estructura una vez que el módulo se haya ejecutado.
d) ¿Cuál es el tamaño de la estructura completa, es decir, cuando se hayan almacenado los 480 x 640 puntos?}

program modulo8practica6;

const
  max_bit = 255;
  columnas = 480;
  filas = 640;
  ini = 1;

type
  rangoGris = 0..max_bit;
  rangoColumnas = ini..columnas;
  rangoFilas = ini..filas;

  fila = array [rangoFilas] of rangoGris;

  ptrFila = ^fila; 

  columna = array [rangoColumnas] of ptrFila;

procedure ingresarFilas(var c: columna);
  var
    i, j: integer;
  begin
    for i := 1 to 100 do begin
              new(c[i]);
      for j := 1 to filas do begin
        readln(c[i]^[j]);
      end;
    end;
  end;

procedure liberarFilas(var c: columna; cant: integer);
  var
    i: integer;
  begin
    for i := 1 to cant do begin
      dispose(c[i]);
      c[i] := nil;
    end;
  end;

{==============================================================================
 CÁLCULO DE TAMAÑOS DE MEMORIA:
 ==============================================================================
 Nota: El tipo rangoGris (0..255) ocupa 1 byte (tipo byte/subrange).
       Cada puntero ocupa 4 bytes.

 Tipo "fila" = array[1..640] of rangoGris = 640 bytes.
 Tipo "columna" = array[1..480] of ptrFila = 480 * 4 = 1.920 bytes (estáticos).

 b) Al comenzar el programa:
    - La variable "c: columna" ocupa 1.920 bytes en la pila.
    - El Heap está vacío: 0 bytes dinámicos.
    - Total en uso: 1.920 bytes.

 c) Después de ingresarFilas (100 filas):
    - 100 punteros apuntan a filas en el Heap: 100 * 640 = 64.000 bytes dinámicos.
    - Total en uso: 1.920 + 64.000 = 65.920 bytes (~64.4 KB).

 d) Con las 480 filas completas:
    - 480 * 640 = 307.200 bytes dinámicos.
    - Total en uso: 1.920 + 307.200 = 309.120 bytes (~301.9 KB).
 ==============================================================================}

var
  c: columna;
begin
  ingresarFilas(c);
  liberarFilas(c, 100);
end.