unit ListaMemoriaPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

const
  N = 100;

type
  t_tipo = (cumpleanios,aniversario,reunion,otro);

  t_dato_lista = record
     id: string;
     titulo:string;
     desc: string;
     tipo: t_tipo;
     fecha_inicio: string;
     fecha_fin: string;
     hora_inicio: string;
     hora_fin: string;
     ubicacion: string;
  end;

  t_lista = record
      cab,act,tam: integer;
      elem: array[1..N] of t_dato_lista;
  end;


function Transf_Fecha(x: string): String;
procedure crearlista(var l: t_lista);
procedure agregar(var l: t_lista; x: t_dato_lista);
function lista_llena(var l: t_lista): boolean;
function lista_vacia(var l: t_lista): boolean;
procedure desplazar_atras(var l: t_lista; posicion: byte);
procedure desplazar_adelante(var l: t_lista; posicion: byte);
procedure eliminarlista(var l: t_lista; buscado: string; var x: t_dato_lista);
procedure siguiente(var l: t_lista);
procedure primero(var l: t_lista);
function fin(l: t_lista): boolean;
function tamanio(var l: t_lista): byte;
procedure recuperar(var l: t_lista; var e: t_dato_lista);

implementation

function Transf_Fecha(x: string): String;
var aux: string[8];
begin
   aux:= copy(x,7,4) + copy(x,4,2) + copy(x,1,2);
   transf_fecha:= aux;
end;

procedure crearlista(var l: t_lista);
begin
  l.cab := 0;
  l.tam := 0;
end;

function tamanio(var l: t_lista): byte;
begin
  tamanio := l.tam;
end;

function lista_llena(var l: t_lista): boolean;
begin
  lista_llena := l.tam = n;
end;

function lista_vacia(var l: t_lista): boolean;
begin
  lista_vacia := l.tam = 0;
end;

procedure desplazar_atras(var l: t_lista; posicion: byte);
var
  i: byte;
begin
  for i := tamanio(l) downto posicion do
    l.elem[i + 1] := l.elem[i];
end;

procedure agregar(var l: t_lista; x: t_dato_lista);
begin
  if (l.cab = 0) then
  begin
    inc(l.cab);
    l.elem[l.cab] := x
  end
  else if (Transf_Fecha(l.elem[l.cab].fecha_inicio) > Transf_Fecha(x.fecha_inicio)) then
  begin
    desplazar_atras(l, 1);
    l.cab := 1;
    l.elem[l.cab] := x
  end
  else
  begin
    l.act := l.cab + 1;
    while (l.act <= tamanio(l)) and (Transf_Fecha(l.elem[l.act].fecha_inicio) < Transf_Fecha(x.fecha_inicio)) do
      inc(l.act);
    if l.act < tamanio(l) then
      desplazar_atras(l, l.act);
    l.elem[l.act] := x;
  end;
  inc(l.tam)
end;

procedure desplazar_adelante(var l: t_lista; posicion: byte);
var
  i: byte;
begin
  for i := posicion to tamanio(l) - 1 do
    l.elem[i] := l.elem[i + 1];
end;

procedure eliminarlista(var l: t_lista; buscado: string; var x: t_dato_lista);
begin
  if (Transf_Fecha(l.elem[l.cab].fecha_inicio) = Transf_Fecha(buscado)) then
  begin
    x := l.elem[l.cab];
    desplazar_adelante(l, 1)
  end
  else
  begin
    l.act := l.cab + 1;
    while (Transf_Fecha(l.elem[l.act].fecha_inicio) <> Transf_Fecha(buscado)) do
      inc(l.act);
    x := l.elem[l.act];
    desplazar_adelante(l, l.act);
  end;
  dec(l.tam)
end;

procedure siguiente(var l: t_lista);
begin
  l.act := l.act + 1;
end;

procedure primero(var l: t_lista);
begin
  l.act := l.cab;
end;

procedure recuperar(var l: t_lista; var e: t_dato_lista);
begin
  e := l.elem[l.act];
end;

function fin(l: t_lista): boolean;
begin
  fin := l.act = tamanio(l) + 1;
end;

end.

