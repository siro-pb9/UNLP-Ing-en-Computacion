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
  FILAS = 480;
  COLUMNAS = 640;

type
  rangoGris = 0..255;
  fila = array[1..COLUMNAS] of rangoGris;
  ptrFila = ^fila;
  matrizImagen = array[1..FILAS] of ptrFila;


procedure llenarFilas(var mat: matrizImagen);
  var
    i, j: integer;
  begin
    for i := 1 to 100 do begin
      new(mat[i]);
      for j := 1 to 640 do begin
        writeln('ingrese el codigo de gris');
        readln(mat[i]^[j]);
      end;
    end;
  end;


procedure borrarMemoria(var mat: matrizImagen);
  var
    i: integer;
  begin
    for i := 1 to 100 do begin
      dispose(mat[i]);
      mat[i] := nil;
    end;
  end;

var
  img: matrizImagen;
begin
  llenarFilas(img);
  borrarMemoria(img);
end.
