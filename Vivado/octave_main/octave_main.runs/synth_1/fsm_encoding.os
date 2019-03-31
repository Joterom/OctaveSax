
 add_fsm_encoding \
       {fsm_control.buf_fsm_w_state} \
       { }  \
       {{000 00} {001 10} {010 11} {011 01} }

 add_fsm_encoding \
       {fsm_control.buf_fsm_r_state} \
       { }  \
       {{000 00010} {001 01000} {010 10000} {011 00100} {100 00001} }
