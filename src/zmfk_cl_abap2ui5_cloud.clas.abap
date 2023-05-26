CLASS zmfk_cl_abap2ui5_cloud DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   INTERFACES z2ui5_if_app.

    DATA product  TYPE string.
    DATA quantity TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmfk_cl_abap2ui5_cloud IMPLEMENTATION.
 METHOD z2ui5_if_app~main.

    "event handling
    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |{ product } { quantity } - sent to the server| ).
    ENDCASE.

    "view rendering
    client->set_next( VALUE #( xml_main = z2ui5_cl_xml_view=>factory(
        )->page( title = 'abap2UI5 - First Example'
            )->simple_form( title = 'Form Title' editable = abap_true
                )->content( 'form'
                    )->title( 'Input'
                    )->label( 'quantity'
                    )->input( client->_bind( quantity )
                    )->label( 'product'
                    )->input( client->_bind( product )
                    )->button( text  = 'post' press = client->_event( 'BUTTON_POST' )
         )->get_root( )->xml_get( ) ) ).

  ENDMETHOD.

ENDCLASS.
