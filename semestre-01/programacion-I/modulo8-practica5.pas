{Dado el siguiente programa, indique que imprime:}

program modulo8practica5;

type  
  PtrInt = ^integer;

procedure multiplica (p: PtrInt; var q: PtrInt);
begin  
  q:= p;
  p^  := p^  * 4;
  writeln('Proceso 1 (p^): ', p^);
  q^  := q^  * 3;
  new(q);
  q^:= 2;
  writeln('Proceso 2 (p^): ', p^);
end;

var   
  p, q: PtrInt;

begin  
  writeln('Inicio (p^): ', p^);
  new(p);  
  p^ := 2;
  writeln('Main 1 (p^): ', p^);
  multiplica(p, q);
  writeln('Main 2 (p^): ', p^);  
  writeln('Main 3 (q^): ', q^);  
  dispose(p);
  dispose(q);
end.
