program project1;

uses crt,TiposDominio, Interfaz, ListaMemoriaPrincipal;
var seleccionado:byte;
    x: t_dato_lista;
    lista: t_lista;

begin
  CrearLista(lista);
  x.tipo:= otro;
  x.desc:= 'sa';
  x.fecha_fin:= 'sa';
  x.fecha_inicio:= 'sa';
  x.hora_fin := 'sa';
  x.hora_inicio:= 'sa';
  x.titulo:= 'sa';
  x.ubicacion:= 'sa';
  x.id:=1;
  Agregar(lista,x);
  Mostrar_Evento(x);
  Busqueda(lista);
  readkey;
end.

