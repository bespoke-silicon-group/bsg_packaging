create_cell {vss_r_0 vss_r_1 vss_r_2 vss_r_3 vss_r_4 vss_r_5 vss_r_6 vss_r_7 vss_r_8} PVSS1DGZ
create_cell {vdd_r_0 vdd_r_1 vdd_r_2 vdd_r_3 vdd_r_4 vdd_r_5 vdd_r_6 vdd_r_7 vdd_r_8} PVDD1DGZ
create_cell {vzz_r_0 vzz_r_1 vzz_r_2 vzz_r_3 vzz_r_4 vzz_r_5 vzz_r_6 vzz_r_7} PVSS2DGZ
create_cell {v18_r_0 v18_r_1 v18_r_2 v18_r_3 v18_r_4 v18_r_5 v18_r_6 v18_r_7} PVDD2DGZ

create_cell {vss_b_0 vss_b_1 vss_b_2 vss_b_3 vss_b_4 vss_b_5 vss_b_6 vss_b_7} PVSS1DGZ
create_cell {vdd_b_0 vdd_b_1 vdd_b_2 vdd_b_3 vdd_b_4 vdd_b_5 vdd_b_6 vdd_b_7} PVDD1DGZ
create_cell {vzz_b_0 vzz_b_1 vzz_b_2 vzz_b_3 vzz_b_4 vzz_b_5 vzz_b_6 vzz_b_7 vzz_b_8} PVSS2DGZ
create_cell {v18_b_0 v18_b_1 v18_b_2 v18_b_3 v18_b_4 v18_b_5 v18_b_6 v18_b_7 v18_b_8} PVDD2DGZ

create_cell {vss_l_0 vss_l_1 vss_l_2 vss_l_3 vss_l_4 vss_l_5 vss_l_6 vss_l_7} PVSS1DGZ
create_cell {vdd_l_0 vdd_l_1 vdd_l_2 vdd_l_3 vdd_l_4 vdd_l_5 vdd_l_6 vdd_l_7} PVDD1DGZ
create_cell {vzz_l_0 vzz_l_1 vzz_l_2 vzz_l_3 vzz_l_4 vzz_l_5 vzz_l_6 vzz_l_7} PVSS2DGZ
create_cell {v18_l_0 v18_l_1 v18_l_2 v18_l_3 v18_l_4 v18_l_5 v18_l_6 v18_l_7} PVDD2DGZ

create_cell {vss_t_0 vss_t_1 vss_t_2 vss_t_3 vss_t_4 vss_t_5 vss_t_6 vss_t_7} PVSS1DGZ
create_cell {vdd_t_0 vdd_t_1 vdd_t_2 vdd_t_3 vdd_t_4 vdd_t_5 vdd_t_6 vdd_t_7} PVDD1DGZ
create_cell {vzz_t_0 vzz_t_1 vzz_t_2 vzz_t_3 vzz_t_4 vzz_t_5 vzz_t_6 vzz_t_7} PVSS2DGZ
create_cell {v18_t_0 v18_t_1 v18_t_2 v18_t_3 v18_t_4 v18_t_5 v18_t_6 v18_t_7} PVDD2DGZ

create_cell vss_pll PVSS1DGZ
create_cell vdd_pll PVDD1DGZ

create_cell {breaker_t_0 breaker_t_1} PRCUT

#create_cell {} PVDD2POC

create_cell {corner_ul corner_ur corner_lr corner_ll} PCORNER
