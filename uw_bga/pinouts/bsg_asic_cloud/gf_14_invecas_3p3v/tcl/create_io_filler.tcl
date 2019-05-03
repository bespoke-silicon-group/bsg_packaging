
create_io_filler -io_guide io_ring.left \
                 -reference_cells { IN14LPP_GPIO33_13M9S30P_FILL20_H IN14LPP_GPIO33_13M9S30P_FILL10_H IN14LPP_GPIO33_13M9S30P_FILL5_H IN14LPP_GPIO33_13M9S30P_FILL1_H } \
                 -overlap_cells IN14LPP_GPIO33_13M9S30P_FILL1_H

create_io_filler -io_guide io_ring.top \
                 -reference_cells { IN14LPP_GPIO33_13M9S30P_FILL20_V IN14LPP_GPIO33_13M9S30P_FILL10_V IN14LPP_GPIO33_13M9S30P_FILL5_V  IN14LPP_GPIO33_13M9S30P_FILL1_V } \
                 -overlap_cells IN14LPP_GPIO33_13M9S30P_FILL1_V

create_io_filler -io_guide io_ring.right \
                 -reference_cells { IN14LPP_GPIO33_13M9S30P_FILL20_H IN14LPP_GPIO33_13M9S30P_FILL10_H IN14LPP_GPIO33_13M9S30P_FILL5_H  IN14LPP_GPIO33_13M9S30P_FILL1_H } \
                 -overlap_cells IN14LPP_GPIO33_13M9S30P_FILL1_H

create_io_filler -io_guide io_ring.bottom \
                 -reference_cells { IN14LPP_GPIO33_13M9S30P_FILL20_V IN14LPP_GPIO33_13M9S30P_FILL10_V IN14LPP_GPIO33_13M9S30P_FILL5_V  IN14LPP_GPIO33_13M9S30P_FILL1_V } \
                 -overlap_cells IN14LPP_GPIO33_13M9S30P_FILL1_V
