{3. Suponiendo que Pascal reserva para los siguientes tipos de datos, la cantidad de bytes que se
indica en la tabla: (Puede variar el tamaño de acuerdo con la versión del compilador Pascal)

Tipo         Cantidad de bytes que ocupa la representación interna en Pascal
Entero       2 bytes
Real         6 bytes
Char         1 byte
String       tantos bytes como indique la longitud del string + 1
Record       suma de las longitudes de los campos del registro
Puntero      4 bytes
Boolean      1 byte

Calcular el tamaño de memoria en los puntos señalados, suponiendo que las variables del programa ya
están declaradas y se cuenta con 400.000 bytes de memoria dinámica posible de ser reservada.

Program Alocacion_Dinamica;
const max=100;
Type
  rango = 1..max;
  puntProducto = ^Producto;
  cadena = string[40];
  producto = record
    tipo : rango;
    descripcion : cadena;
    precio : real;
    categoria : char;
  end;
Var
  p: Producto;
  ptrProducto: puntProducto;
Begin
  // Suponga que en este punto hay 400.000 bytes de memoria disponible (1)
  Readln( p.tipo );
  // Piense si la lectura anterior ha hecho variar la cantidad de memoria (2)
  New(ptrProducto);
  // ¿Cuánta memoria disponible hay ahora? (3)
  Readln( ptrProducto^.tipo, ptrProducto^.descripcion );
  Readln( ptrProducto^.precio, ptrProducto^.categoria);
  // ¿Cuánta memoria disponible hay ahora? (4)
  Dispose( ptrProducto );
  // ¿Cuánta memoria disponible hay ahora? (6)
end.}

{==============================================================================
 CÁLCULO DE MEMORIA Y RESPUESTAS:
 ==============================================================================

 1. Tamaño del tipo "producto":
    - tipo: rango (subrango de entero) = 2 bytes (según tabla, Entero = 2 bytes)
    - descripcion: string[40]          = 41 bytes (40 + 1)
    - precio: real                     = 6 bytes  (según tabla)
    - categoria: char                  = 1 byte   (según tabla)
    ----------------------------------------------------------
    TOTAL registro producto            = 50 bytes.
    (Nota: si el compilador tomara rango 1..100 en 1 byte, serían 49 bytes.
           La cátedra suele tomar subrangos como enteros de 2 bytes -> 50 bytes).

 2. Memoria Estática (Stack / Variables declaradas en Var):
    - p: Producto                      = 50 bytes
    - ptrProducto: puntProducto        = 4 bytes
    ----------------------------------------------------------
    Total estático                     = 54 bytes (NO afecta al Heap).

 3. Respuestas en cada punto señalado:

    PUNTO (1):
      Memoria dinámica disponible: 400.000 bytes.
      (El espacio disponible inicial en el Heap es 400.000 bytes).

    PUNTO (2): Readln(p.tipo);
      ¿Ha variado la memoria dinámica disponible?: NO.
      Justificación: La variable "p" es estática (reside en la pila). Modificar
      su valor por teclado no realiza ninguna reserva ni liberación en el Heap.
      Memoria dinámica disponible: Siguen siendo 400.000 bytes.

    PUNTO (3): New(ptrProducto);
      Memoria dinámica disponible: 399.950 bytes (400.000 - 50 bytes).
      (o 399.951 bytes si se toma subrango como 1 byte).
      Justificación: New aloca en el Heap el espacio exacto para un registro "producto".

    PUNTO (4): Readln(ptrProducto^.tipo, ...);
      Memoria dinámica disponible: Siguen siendo 399.950 bytes.
      Justificación: La lectura únicamente escribe valores en las posiciones de
      memoria ya reservadas; no solicita bloques adicionales al Heap.

    PUNTO (6): Dispose(ptrProducto);
      Memoria dinámica disponible: Vuelven a ser 400.000 bytes.
      Justificación: Dispose devuelve al Heap los 50 bytes que habían sido
      reservados por New, restaurando la capacidad original.
 ==============================================================================}

program modulo8practica3;

const
  max = 100;

type
  rango = 1..max;
  cadena = string[40];

  producto = record
    tipo : rango;
    descripcion : cadena;
    precio : real;
    categoria : char;
  end;

  puntProducto = ^producto;

var
  p: producto;
  ptrProducto: puntProducto;

begin
  // (1) Memoria dinámica disponible: 400.000 bytes
  // Readln(p.tipo);

  // (2) Memoria dinámica disponible: 400.000 bytes (no varía)
  new(ptrProducto);

  // (3) Memoria dinámica disponible: 399.950 bytes (-50 bytes en Heap)
  // Readln(ptrProducto^.tipo, ptrProducto^.descripcion);
  // Readln(ptrProducto^.precio, ptrProducto^.categoria);

  // (4) Memoria dinámica disponible: 399.950 bytes (no varía)
  dispose(ptrProducto);
  ptrProducto := nil;

  // (6) Memoria dinámica disponible: 400.000 bytes (recupera los 50 bytes)
end.
