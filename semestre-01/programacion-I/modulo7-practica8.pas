{8. *Dada una secuencia de 1000 posts correspondientes al mes pasado que fueron seleccionados para 
calcular algunas estadísticas. Sabiendo que cada post contiene información de la fecha y del texto (de 
un máximo 280 caracteres) en que fue publicado se pide calcular e informar:
a) La cantidad de hashtags (palabras que empiezan con el carácter ‘#’) y usuarios (palabras que 
empiezan con carácter ‘@’).
b) La cantidad de posts publicados cada día.
c) La cantidad promedio de palabras de un post.}

program modulo7practica8;

const
  posts = 1000;
  max_texto = 280;
  ini = 1;
  dias = 30;

type
  rangoDias = ini..dias;
  rangoPosts = ini..posts;
  rangoTexto = ini..max_texto;

  vectorTexto = array [rangoTexto] of char;
  texto = record
    v: vectorTexto;
    DimL: 0..max_texto;
  end;

  post = record
    fecha: rangoDias;
    texto: texto;
  end;

  vectorPosts = array [rangoPosts] of post;

  vectorDias = array [rangoDias] of integer;

  cantidades = record
    pal: integer;
    hash: integer;
    usu: integer;
    dia: vectorDias;
  end;

procedure inicializarContadores (var c: cantidades); 
  var
    i: integer;
  begin
    with c do begin
      pal := 0;
      hash := 0;
      usu := 0;
      for i := 1 to dias do
        dia[i] := 0;
    end;
  end;

procedure contarPalabras(const p: vectorPosts; var c: cantidades);
  var
    i, j: integer;
    act, antcar: char;
  begin
    for i := 1 to posts do begin
      c.dia[p[i].fecha] := c.dia[p[i].fecha] + 1;
      if (p[i].texto.DimL > 0) then begin
        antcar := ' ';
        for j := 1 to p[i].texto.DimL do begin
          act := p[i].texto.v[j];
          if (antcar = ' ') and (act <> ' ') then begin
            c.pal := c.pal + 1;
            if (act = '#') then
              c.hash := c.hash + 1
            else if (act = '@') then
              c.usu := c.usu + 1;
          end;
          antcar := act;
        end;
      end;
    end;
  end;

function promedioPal(const c: cantidades): real; 
  begin
    promedioPal := c.pal / posts;
  end;

procedure informar(const c: cantidades);
  var
    i: integer;
  begin
    writeln(c.hash);
    writeln(c.usu);
    for i := 1 to dias do
      writeln(c.dia[i]);
    writeln(promedioPal(c):0:2);
  end;
    
var
  c: cantidades;
  p: vectorPosts;
begin
  inicializarContadores(c);
  // cargarPosts(p); // Modulo inexistente, se presupone que el vector de Posts ya viene cargado
  contarPalabras(p, c);
  informar(c);
  readln;
end.