{Calcular e imprimir el porcentaje de estudiantes aprobados 
sabiendo que del total de inscriptos (160), aprobaron 48 estudiantes.}

program modulo1practica2;

const
  tot = 160;
  apr = 48;

begin
  writeln('El porcentaje de aprobados es ', apr * 100 / tot:0:2,'%');
  readln;
end.
