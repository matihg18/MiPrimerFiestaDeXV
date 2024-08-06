unit Interfaz;

{$mode ObjFPC}{$H+}

interface

uses
  crt, TiposDominio;

procedure menu_opciones(var seleccionado:byte);
procedure menu_opciones_busqueda(var seleccionado:byte);

implementation

procedure menu_opciones(var seleccionado:byte);
var
  exit:boolean;
  tecla:char;
begin
  exit:=false;
  seleccionado:=1;

  while not exit do
  begin
    clrscr;
    if seleccionado=1 then textbackground(4) else textbackground(0);
    writeln('Registrar Evento');
    if seleccionado=2 then textbackground(4) else textbackground(0);
    writeln('Buscar Evento');
    if seleccionado=3 then textbackground(4) else textbackground(0);
    writeln('Eliminar Evento');
    if seleccionado=4 then textbackground(4) else textbackground(0);
    writeln('Salir');
    textbackground(0);
    tecla:=readkey;

    if tecla=#00 then tecla:=readkey;

    case tecla of
    #72:  if seleccionado>1 then seleccionado:=seleccionado-1;
    #80:  if seleccionado<4 then seleccionado:=seleccionado+1;
    #13:  exit:=true;
    end;
  end;
end;

procedure menu_opciones_busqueda(var seleccionado:byte);
var
  exit:boolean;
  tecla:char;
begin
  exit:=false;
  seleccionado:=1;

  while not exit do
  begin
    clrscr;
    if seleccionado=1 then textbackground(4) else textbackground(0);
    writeln('Buscar por Tipo de Evento');
    if seleccionado=2 then textbackground(4) else textbackground(0);
    writeln('Buscar Entre Fechas');
    if seleccionado=3 then textbackground(4) else textbackground(0);
    writeln('Buscar por Subcadena en el Titulo');
    if seleccionado=4 then textbackground(4) else textbackground(0);
    writeln('Salir');
    textbackground(0);
    tecla:=readkey;

    if tecla=#00 then tecla:=readkey;

    case tecla of
    #72:  if seleccionado>1 then seleccionado:=seleccionado-1;
    #80:  if seleccionado<4 then seleccionado:=seleccionado+1;
    #13:  exit:=true;
    end;
  end;
end;


end.

