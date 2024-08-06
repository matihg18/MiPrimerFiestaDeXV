unit TiposDominio;

{$mode ObjFPC}{$H+}

interface

uses
  ListaMemoriaPrincipal, Interfaz;

procedure Registrar_Evento(var l: t_lista);
procedure Busqueda(var l: t_lista);
procedure Buscar_Por_Fechas(var l:t_lista);
procedure Buscar_Por_Evento(var l: t_lista);
Procedure Buscar_Por_Titulo(var l: t_lista);
procedure Eliminar_Evento(var l:t_lista);


implementation

procedure Registrar_Evento(var l: t_lista);
var
  aux: string;
  x: t_dato_lista;
begin
   write('Ingrese titulo: ');
   readln(x.titulo);
   While not(StrToTipo(aux) in [cumpleanios..otro]) do
   begin
     write('Ingrese tipo: ');
     readln(aux);
   end;
   x.tipo:= StrToTipo(aux);
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
   while not(Valida_Hora(x.hora_inicio)) do
   begin
        write('Ingrese hora de inicio: ');
        readln(x.hora_inicio);
   end;
   while not(Valida_Hora(x.hora_fin)) do
   begin
        write('Ingrese hora de final: ');
        readln(x.hora_fin);
   end;
   Write('Ingrese ubicacion: ');
   readln(x.ubicacion);
   x.id:= l.tam + 1;
   agregar(l,x);
end;

procedure Busqueda(var l: t_lista);
var seleccionado: byte;
begin
    Menu_Opciones_Busqueda(seleccionado);
    case seleccionado of
         1: Buscar_Por_Evento(l);
         2: Buscar_Por_Fechas(l);
         3: Buscar_Por_Titulo(l)
    end;
end;

procedure Buscar_Por_Evento(var l: t_lista);
var buscado: string;
    aux: t_dato_lista;
    aux_tipo: t_tipo;
begin
   write('Ingrese tipo de evento a Buscar: ');
   readln(buscado);
   aux_tipo:= StrToTipo(Lowercase(buscado));
   if not(aux_tipo in [cumpleanios..otro]) then writeln('No existe el Tipo de Evento Ingresado')
   else
   Primero(l);
       while not(Fin(l)) do
       begin
          Recuperar(l,aux);
          if (TipoToStr(aux.tipo) = buscado) then
             Mostrar_Evento(aux);
          Siguiente(l);
       end;
end;

procedure Buscar_Por_Fechas(var l:t_lista);
var buscado_ini: string;
    buscado_fin: string;
    aux: t_dato_lista;
begin
   while not(Valida_Fecha(buscado_ini)) do
   begin
         write('Ingrese Fecha de Inicio(DD/MM/YYYY): ');
         readln(buscado_ini);
   end;
   while not(Valida_Fecha(buscado_fin)) do
   begin
         write('Ingrese Fecha de Fin(DD/MM/YYYY): ');
         readln(buscado_fin);
   end;
   Primero(l);
   While not(Fin(l)) do
   begin
      Recuperar(l,aux);
      if (Transf_Fecha(aux.fecha_inicio) >= Transf_Fecha(buscado_ini)) and (Transf_Fecha(aux.fecha_fin) <= Transf_Fecha(buscado_fin)) then
         Mostrar_Evento(aux);
      Siguiente(l);
   end;
end;

Procedure Buscar_Por_Titulo(var l: t_lista);
var
  buscado: string;
  aux: t_dato_lista;
begin
  buscado:= '';
  while length(buscado) < 3 do
  begin
  write('Ingrese el titulo del evento: ');
  readln(buscado);
  end;
  Primero(l);
  While not(Fin(l)) do
  begin
    recuperar(l,aux);
    if Pos(buscado,aux.titulo)<>0 then
      Mostrar_Evento(aux);
    Siguiente(l);
  end;
end;

procedure Eliminar_Evento(var l:t_lista);
var aux: integer;
  x: t_dato_lista;
begin
  Write('Ingrese el ID del evento: ');
  readln(aux);
  EliminarLista(l,aux,x);
end;

end.

