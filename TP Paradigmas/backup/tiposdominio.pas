unit TiposDominio;

{$mode ObjFPC}{$H+}

interface

uses
  ListaMemoriaPrincipal;
procedure registrar_evento(var l: t_lista);
implementation

procedure registrar_evento(var l: t_lista);
var
  x: t_dato_lista;
begin
   write('Ingrese titulo: ');
   readln(x.titulo);
   {While not(x.tipo in t_tipo) do
   begin
     write('Ingrese tipo: ');
     readln(x.tipo);
   end; }
   write('Ingrese descripcion: ');
   readln(x.desc);
   while not(Valida_Fecha(x.fecha_inicio)) do
   begin
     write('Ingrese fecha de inicio: ');
     readln(x.fecha_inicio);
   end;
   while not(Valida_Fecha(x.fecha_fin)) do
   begin
     write('Ingrese fecha de final: ');
     readln(x.fecha_fin);
   end;
   write('Ingrese hora de inicio: ');
   readln(x.hora_inicio);
   write('Ingrese fecha de final: ');
   readln(x.hora_fin);
   agregar(l,x);
end;

end.

