{2. Dada la siguiente declaración, representar gráficamente las distintas operaciones sobre las variables
de tipo puntero, e indicar el contenido de las variables asociadas y qué problemas se presentan.
Represente cada variable como una caja.

Program punteros;
type
  ptr_bool = ^boolean;
  Ptr_compu = ^computadora;
  computadora = record
    procesador : string;
    memoria : integer;
    dvd : ptr_bool;
  end;
var c1, c2 : Ptr_compu;
begin
  a) new(c1); new(c2);
  b) c1^.procesador := 'Intel Core i11';
  c) c2:= c1;
  d) write(c2^.procesador);
  e) write(c2^.memoria);
  f) dispose(c2);
  g) write(c2^.procesador);
end.}

{==============================================================================
 ANÁLISIS PASO A PASO Y RESPUESTAS TEÓRICAS:
 ==============================================================================

 Variables estáticas (Stack):
   c1: Ptr_compu (puntero, 4 bytes)
   c2: Ptr_compu (puntero, 4 bytes)

 Pasos:
 a) new(c1); new(c2);
    - Se alocan dos registros independientes en el Heap:
      c1 apunta a [Dir1]: (procesador: '', memoria: basura, dvd: basura)
      c2 apunta a [Dir2]: (procesador: '', memoria: basura, dvd: basura)

 b) c1^.procesador := 'Intel Core i11';
    - En [Dir1], el campo procesador se actualiza:
      [Dir1].procesador := 'Intel Core i11'

 c) c2 := c1;
    - Asignación de punteros: c2 ahora copia la dirección almacenada en c1 (ambos apuntan a [Dir1]).
    - PROBLEMA PRESENTADO (Fuga de memoria / Garbage):
      El bloque de memoria en [Dir2] queda inaccesible en el Heap porque
      ningún puntero conserva su dirección y nunca se le aplicó dispose(c2).
      Esa memoria se pierde hasta el fin del programa.

 d) write(c2^.procesador);
    - Imprime: "Intel Core i11" (correcto, c2 apunta a [Dir1]).

 e) write(c2^.memoria);
    - PROBLEMA PRESENTADO:
      Imprime basura / valor indefinido, ya que el campo memoria de [Dir1]
      jamás fue inicializado.

 f) dispose(c2);
    - Se libera la memoria del registro en [Dir1].
    - PROBLEMA PRESENTADO (Puntero colgado / Dangling Pointer):
      c2 queda apuntando a memoria liberada.
      c1 TAMBIÉN queda como puntero colgado, ya que ambos apuntaban a [Dir1].

 g) write(c2^.procesador);
    - PROBLEMA PRESENTADO (Error grave de acceso ilegal a memoria):
      Se intenta leer un campo a través de un puntero que ya fue liberado.
      Esto produce comportamiento indefinido (puede imprimir basura, corromper
      memoria o lanzar Access Violation / SIGSEGV).
 ==============================================================================}

program modulo8practica2;

type
  ptr_bool = ^boolean;
  Ptr_compu = ^computadora;
  computadora = record
    procesador : string;
    memoria : integer;
    dvd : ptr_bool;
  end;

var
  c1, c2 : Ptr_compu;

begin
  // a)
  new(c1);
  new(c2);

  // b)
  c1^.procesador := 'Intel Core i11';

  // c) Fuga de memoria: se pierde la referencia previa de c2
  c2 := c1;

  // d)
  write(c2^.procesador);

  // e) Lectura de campo no inicializado (imprime basura)
  // write(c2^.memoria);

  // f) Se libera Dir1. Tanto c2 como c1 quedan colgados (dangling pointers)
  dispose(c2);
  c2 := nil;
  c1 := nil;

  // g) Acceso a memoria liberada (comentado para evitar violación de acceso en runtime)
  // write(c2^.procesador);
end.
