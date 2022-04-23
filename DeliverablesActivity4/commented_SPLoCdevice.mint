DEVICE variable_volume_mixer

LAYER FLOW

//Input reserviors
PORT input_A, input_B, input_C, input_D, input_D, input_E r=700;

//Output reservoirs
PORT output_X, output_Y, output_Z r=700;

//Nodes connecting the input reservoirs for the different
//mixing combinations
//mi_l is the left node of mix-incubator complex
//mi_r is right node of the complex
PORT node_ae, node_bcd r=50;
PORT mi_l, mi_r r=50;

//node following the mixer/incubator complex
PORT post_mixing r=50;

//incubator-mixer complex where the incubator is a MIXER
//greater length with one more bend
H MIXER incubator numbends=2 bendlength=7580 channelWidth=800 bendspacing=1230;
H MIXER mix numbends=1 bendlength=7580 channelWidth=800 bendspacing=1230;

//channels for input reservoirs a,e to first node
CHANNEL a_output from input_A to node_ae;
CHANNEL e_ouput from input_E to node_ae;

//channels for input reservoirs b,c,d to first node
CHANNEL b_ouput from input_B to node_bcd;
CHANNEL c_ouput from input_C to node_bcd;
CHANNEL d_ouput from input_D to node_bcd;

//previous channels along with their valves allow for
//every possible mix combo of 5 initial liquids

CHANNEL node_connect from node_bcd to node_ae;


CHANNEL pump1 from node_ae to mi_l;

//channels for the entire route of mixing+incubation
//once sensor paired with microfluidic device reaches
//threshold, direct route channel is taken to proceed to 
//output reservoirs 
CHANNEL mixer_route from mi_l to mix;
CHANNEL mixer_route2 from mix to mi_r;
CHANNEL incubator_route2 from mi_r to incubator;
CHANNEL incubator_route from incubator to mi_l;
CHANNEL direct_route from mi_l to mi_r;

//output channels to 3 different output reservoirs
CHANNEL p_mix from mi_r to post_mixing;

CHANNEL x_input from post_mixing to output_X;
CHANNEL y_input from post_mixing to output_Y;
CHANNEL z_input from post_mixing to output_Z;

END LAYER


LAYER CONTROL

VALVE a_v, b_v, c_v, d_v, e_v;
VALVE have_a_total_of_15_valves_like_this;

END LAYER