
DEVICE variable_volume_mixer

LAYER FLOW

PORT input_A, input_B, input_C, input_D, input_D, input_E r=700;
PORT output_X, output_Y, output_Z r=700;

PORT node_ae, node_bcd r=100;
PORT mi_l, mi_r r=100;

PORT post_mixing r=100;


H MIXER incubator numbends=2 bendlength=7580 channelWidth=800 bendspacing=1230;
H MIXER mix numbends=1 bendlength=7580 channelWidth=800 bendspacing=1230;

CHANNEL a_output from input_A to node_ae;
CHANNEL e_ouput from input_E to node_ae;

CHANNEL b_ouput from input_B to node_bcd;
CHANNEL c_ouput from input_C to node_bcd;
CHANNEL d_ouput from input_D to node_bcd;

CHANNEL node_connect from node_bcd to node_ae;

CHANNEL pump1 from node_ae to mi_l;


CHANNEL mixer_route from mi_l to mix;
CHANNEL mixer_route2 from mix to mi_r;
CHANNEL incubator_route2 from mi_r to incubator;
CHANNEL incubator_route from incubator to mi_l;
CHANNEL direct_route from mi_l to mi_r;


CHANNEL p_mix from mi_r to post_mixing;

CHANNEL x_input from post_mixing to output_X;
CHANNEL y_input from post_mixing to output_Y;
CHANNEL z_input from post_mixing to output_Z;

END LAYER


LAYER CONTROL

VALVE a_v, b_v, c_v, d_v, e_v;
VALVE have_a_total_of_15_valves_like_this;

END LAYER