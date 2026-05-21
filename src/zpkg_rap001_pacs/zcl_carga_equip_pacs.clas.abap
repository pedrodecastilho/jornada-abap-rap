CLASS zcl_carga_equip_pacs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_carga_equip_pacs IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Cria uma tabela interna que irá receber os dados
    DATA: it_equip TYPE TABLE OF ztb_equip_pacs.

    " Limpaa tabela antes de inserir os registros
    DELETE FROM ztb_equip_pacs.

    " Prepara os dados
    it_equip = VALUE #(
      ( client = sy-mandt equip_id = cl_system_uuid=>create_uuid_x16_static( ) employee_name = 'João Silva'   equip_type = 'Notebook' serial_number = 'DELL-12345' status = 'Ativo' )
      ( client = sy-mandt equip_id = cl_system_uuid=>create_uuid_x16_static( ) employee_name = 'Maria Souza'  equip_type = 'Monitor'  serial_number = 'LG-98765'   status = 'Ativo' )
      ( client = sy-mandt equip_id = cl_system_uuid=>create_uuid_x16_static( ) employee_name = 'Carlos Gomes' equip_type = 'Notebook' serial_number = 'MAC-45678'  status = 'Devolvido' )
    ).

    " Insere no banco de dados
    INSERT ztb_equip_pacs FROM TABLE @it_equip.

    " Retorna mensagem no console
    IF sy-subrc EQ 0.
      out->write( 'Dados inseridos com sucesso na tabela ZTB_EQUIP_PACS.' ).
    ELSE.
      out->write( 'Erro ao inserir os dados na tabela.' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
