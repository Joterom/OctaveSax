
 add_fsm_encoding \
       {master_controller.buf_fsm_w_state} \
       { }  \
       {{000 00} {001 10} {010 11} {011 01} }

 add_fsm_encoding \
       {master_controller.buf_fsm_r_state} \
       { }  \
       {{000 001} {001 011} {010 100} {011 010} {100 000} }
