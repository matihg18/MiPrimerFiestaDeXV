unit TiposDominio;

{$mode ObjFPC}{$H+}

interface

uses
  ListaMemoriaPrincipal, Interfaz;

procedure Registrar_Evento(var l: t_lista);
procedure Busqueda(var l: t_lista);
procedure Buscar_Por_Evento(var l: t_lista);

implementation

procedure Registrar_Evento(var l: t_lista);
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
         //3: Buscar_Por_Subcad(l)
    end;
end;

procedure Buscar_Por_Evento(var l: t_lista);
var buscado: string;
    aux: t_dato_lista;
begin
   write('Ingrese tipo de evento a Buscar: ');
   readln(buscado);
   //if not(Lowercase(buscado) in t_tipo) then writeln('No existe el Tipo de Evento Ingresado')
   //else
   Primero(l);
       while not(Fin(l)) do
       begin
          Recuperar(l,aux);
          if (aux.tipo = buscado) then
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

end.

