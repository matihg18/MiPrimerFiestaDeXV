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

function Valida_Fecha(x: shortstring): boolean;
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
function Valida_Fecha(x: shortstring): boolean;
var dia,mes: ShortInt; anio: integer;
begin
  valida_fecha:= false;
  if Length(x) = 10 then
    if (x[1] in ['0'..'3']) and (x[2] in ['0'..'9']) and (x[3] = '/') and (x[4] in ['0','1']) and (x[5] in ['0'..'9']) and (x[6] = '/') and (x[7] in ['1','2']) and (x[8] in ['0','9']) and (x[9] in ['0'..'9']) and (x[10] in ['0'..'9'])  then
    begin
      dia:= StrToInt(x[1] + x[2]);
      mes:= StrToInt(x[4] + x[5]);
      anio:= StrToInt(x[7] + x[8] + x[9] + x[10]);
      if ((anio >= 1900) and (anio <= 2024)) and (((mes in [1,3,5,7,8,10,12]) and (dia in [1..31])) or ((mes in [4,6,9,11]) and (dia in [1..30])) or ((mes = 2) and (dia in [1..28])) or (((anio mod 4) = 0) and (mes = 2) and (dia = 29))) then
        valida_fecha:= true;
    end;
end;
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

