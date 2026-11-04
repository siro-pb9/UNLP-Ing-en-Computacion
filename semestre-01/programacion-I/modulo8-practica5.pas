{5. Dado el siguiente programa, indique que imprime:

Program ejemplo;
Type
  PtrInt = ^integer;

Procedure multiplica (p: PtrInt; var q: PtrInt);
Begin
  q:= p;
  p^ := p^ * 4;
  writeln(p^);
  q^ := q^ * 3;
  new(q);
  q^:= 2;
  writeln(p^);
End;

Var
  p, q: PtrInt;

Begin
  writeln(p^);
  new (p);
  p^ := 2;
  writeln(p^);
  multiplica (p, q);
  writeln(p^);
  writeln(q^);
  dispose(p);
  dispose(q);
End.}

{==============================================================================
 RASTREO Y RESPUESTA (¿QUÉ IMPRIME?):
 ==============================================================================

 1. writeln(p^);  [en el Main antes de new]
    - ERROR / BASURA: p no fue inicializado con new. Acceder a p^ antes de
      asignarle memoria produce comportamiento indefinido (imprime basura o
      falla con Access Violation / SIGSEGV).

 2. new(p); p^ := 2; writeln(p^);
    - Imprime: 2

 3. Inicia multiplica(p, q):
    - Parámetro p se pasa POR VALOR (copia local de la dirección).
    - Parámetro q se pasa POR REFERENCIA (modifica directamente el q del Main).
    - q := p;           -> q apunta al mismo nodo que p (valor 2).
    - p^ := p^ * 4;     -> El valor común pasa a ser 2 * 4 = 8.
    - writeln(p^);      -> Imprime: 8
    - q^ := q^ * 3;     -> El valor común pasa a ser 8 * 3 = 24.
    - new(q);           -> Se reserva un NUEVO nodo dinámico para q.
    - q^ := 2;          -> En el nuevo nodo se guarda 2.
    - writeln(p^);      -> p local sigue apuntando al nodo original (24).
                           Imprime: 24

 4. De regreso en el Main:
    - writeln(p^);      -> p del Main sigue apuntando al nodo original.
                           Imprime: 24
    - writeln(q^);      -> q del Main ahora apunta al nuevo nodo (por var).
                           Imprime: 2
    - dispose(p); dispose(q); -> Libera ambos nodos correctamente.

 SECUENCIA DE SALIDAS EN PANTALLA:
   [Basura / Error en runtime]
   2
   8
   24
   24
   2
 ==============================================================================}

program modulo8practica5;

type  
  PtrInt = ^integer;

procedure multiplica (p: PtrInt; var q: PtrInt);
begin  
  q := p;
  p^ := p^ * 4;
  writeln(p^);
  q^ := q^ * 3;
  new(q);
  q^ := 2;
  writeln(p^);
end;

var   
  p, q: PtrInt;

begin  
  // writeln(p^); // Comentado para evitar crasheo por puntero no inicializado
  new(p);  
  p^ := 2;
  writeln(p^);
  multiplica(p, q);
  writeln(p^);  
  writeln(q^);  
  dispose(p);
  dispose(q);
  p := nil;
  q := nil;
end.
