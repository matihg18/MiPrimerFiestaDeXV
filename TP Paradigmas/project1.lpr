program project1;

uses crt,TiposDominio, Interfaz, ListaMemoriaPrincipal;
var seleccionado:byte;
    x: t_dato_lista;
    lista: t_lista;

begin
  CrearLista(lista);
  x.tipo:= otro;
  x.desc:= 'sa';
  x.fecha_fin:= '19/05/2005';
  x.fecha_inicio:= '19/05/2005';
  x.hora_fin := 'sa';
  x.hora_inicio:= 'sa';
  x.titulo:= 'sa';
  x.ubicacion:= 'sa';
  x.id:=1;
  Agregar(lista,x);
  Busqueda(lista);
  readkey;
end.

