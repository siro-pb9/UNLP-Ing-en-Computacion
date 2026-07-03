{ ============================================= }
{ EJEMPLO DIDACTICO - Punteros en Pascal        }
{ Programacion I - UNLP                         }
{ ============================================= }
{ Este archivo es para que experimentes.        }
{ Compilalo, correlo, modificalo, rompelo.      }
{ ============================================= }

program punterosEjemplo;

type
  ptrEntero = ^integer;

var
  p, q: ptrEntero;

begin
  { === PASO 1: Reservar memoria === }
  writeln('--- Paso 1: New ---');
  New(p);           { p ahora apunta a un espacio en el heap }
  p^ := 10;         { Guardamos 10 en ese espacio }
  writeln('p^ = ', p^);   { Imprime: 10 }

  { === PASO 2: Asignacion de punteros (copiar la flecha) === }
  writeln('--- Paso 2: q := p ---');
  q := p;           { q apunta al MISMO lugar que p }
  writeln('q^ = ', q^);   { Imprime: 10 (es la misma caja) }

  { === PASO 3: Modificar a traves de q afecta a p === }
  writeln('--- Paso 3: Modificar q^ ---');
  q^ := 99;
  writeln('q^ = ', q^);   { Imprime: 99 }
  writeln('p^ = ', p^);   { Imprime: 99 tambien! (misma caja) }

  { === PASO 4: Cada uno con su propia memoria === }
  writeln('--- Paso 4: New(q) separado ---');
  New(q);            { Ahora q apunta a una caja NUEVA y distinta }
  q^ := 50;
  writeln('q^ = ', q^);   { Imprime: 50 }
  writeln('p^ = ', p^);   { Imprime: 99 (su caja no cambio) }

  { === PASO 5: Copiar el valor (no la flecha) === }
  writeln('--- Paso 5: q^ := p^ ---');
  q^ := p^;          { Copia el VALOR de p^ a q^ }
  writeln('q^ = ', q^);   { Imprime: 99 }
  writeln('p^ = ', p^);   { Imprime: 99 }
  { Pero son cajas distintas! Probemos: }
  p^ := 1;
  writeln('Despues de p^ := 1:');
  writeln('p^ = ', p^);   { Imprime: 1 }
  writeln('q^ = ', q^);   { Imprime: 99 (no cambio, es otra caja) }

  { === PASO 6: Liberar memoria === }
  writeln('--- Paso 6: Dispose ---');
  Dispose(p);
  Dispose(q);
  writeln('Memoria liberada correctamente.');

  readln;
end.
