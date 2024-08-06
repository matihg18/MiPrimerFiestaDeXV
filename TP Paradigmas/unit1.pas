unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

implementation

Procedure Buscar_Por_Titulo(var l: t_lista);
var
  buscado: string;
  aux: t_dato_lista;
begin
  while length(buscado) < 3 do
  begin
  write('Ingrese el titulo del evento: ');
  readln(buscado);
  end;
  While not(Fin(l)) do
  begin
    recuperar(l,aux);
    if Pos(buscado,aux.titulo)<>0 then
      Mostrar_Evento(aux);
  end;
end;

end.

