program project1;

uses TiposDominio, Interfaz, ListaMemoriaPrincipal;
var seleccionado:byte;
    lista: t_lista;

begin
  menu_opciones(seleccionado);
  if seleccionado = 1 then
     registrar_evento(lista);
end.

