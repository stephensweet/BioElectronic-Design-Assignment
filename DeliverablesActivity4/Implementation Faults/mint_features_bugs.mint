ERROR 1 Descrption starts on line 3
ERROR 2 Description starts on line 83
ERROR 3/comment start line 129

additional comment: based on the documentation and github wiki tutorial for mint only rotory pumps seem to be available as a pump
component (under predefined modules). But no other pump feauture is present for example in primitives. In theory if we were not getting
error 1 we could have used three valves at a channel specific location with ports represneting gas control to represent a pump part
(this combination could also be developed into a pump component) 

Error when attempting place valve on a_ouput. Was not able to specify channel location of valves. Including some 'floating' valves
and that we have a total of 15 valves in our design. Fluigi output below:

PAR Return code:0
Component input_D already present in device, hence skipping the component
Traceback (most recent call last):
  File "//.pyenv/versions/3.8.0/bin/fluigi", line 8, in <module>
    sys.exit(main())
  File "//.pyenv/versions/3.8.0/lib/python3.8/site-packages/fluigi/cmdline.py", line 233, in main
    par_device = generate_device_from_parchmint(str(temp_parchmint_file))
  File "//.pyenv/versions/3.8.0/lib/python3.8/site-packages/fluigi/cmdline.py", line 80, in generate_device_from_parchmint
    return Device(device_json)
  File "/pybin/pyparchmint/parchmint/device.py", line 71, in __init__
    self.parse_from_json(json)
  File "/pybin/pyparchmint/parchmint/device.py", line 296, in parse_from_json
    self._valve_map[self.get_component(key)] = self.get_connection(value)
TypeError: unhashable type: 'Component'

This is the code I ran to get above error (if you line 70 there is no error): 
//
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

VALVE a_v on a_ouput;

END LAYER
//

When compiling the code above, while it does give an error message, it still produces an ouput file, including the pdf of the mapping.
I will incldue this pdf in the report. Essentially the valves appear on the mapping, but they are just floating parts, as if I ran the 
following code (which FYI does compile) //VALVE a_v//





Error when trying to use 'NODE' primitive, will not compile. Instead had to use ports for channel connections
See fluigi ouput below:

output dir: /var/www/fluigicad.org/jobs/tmp__62633d81b92a3d0017915552/output
Running File: /var/www/fluigicad.org/jobs/tmp__62633d81b92a3d0017915552/mint_errors.mint
Creating the output directory:
Component input_D already present in device, hence skipping the component
Computing Constraints
Pulling Default Values of Components
Deleted unsupported param "r" from component input_A : PORT
Deleted unsupported param "r" from component input_B : PORT
Deleted unsupported param "r" from component input_C : PORT
Deleted unsupported param "r" from component input_D : PORT
Deleted unsupported param "r" from component input_D : PORT
Deleted unsupported param "r" from component input_E : PORT
Deleted unsupported param "r" from component output_X : PORT
Deleted unsupported param "r" from component output_Y : PORT
Deleted unsupported param "r" from component output_Z : PORT
Pulling Dimensions of Components
Pulling Terminals of Components
Setting Default MAX Dimensions to the device: (76200, 76200)
Traceback (most recent call last):
  File "//.pyenv/versions/3.8.0/bin/fluigi", line 8, in <module>
    sys.exit(main())
  File "//.pyenv/versions/3.8.0/lib/python3.8/site-packages/fluigi/cmdline.py", line 165, in main
    size_nodes(current_device)
  File "//.pyenv/versions/3.8.0/lib/python3.8/site-packages/fluigi/pnr/utils.py", line 11, in size_nodes
    gedge = list(nbers)[0]
IndexError: list index out of range


This is the code ran and got this error, just a simple node delcaration:
//
DEVICE variable_volume_mixer

LAYER FLOW

PORT input_A, input_B, input_C, input_D, input_D, input_E r=700;
PORT output_X, output_Y, output_Z r=700;

NODE test_node;

END LAYER
//

Not sure if you should be able to comment mint code in the web editor, but I couldn't figure out how to do it. Commenting the code would
produce a compilation error. To remedey this, we've included an uncommented version of our mint file which runs on neptune/fluigi,
and an additional more robust commented mint file. See the error message from fluigi after running our commented mint file below: 

output dir: /var/www/fluigicad.org/jobs/tmp__626343abb92a3d0017915574/output
Running File: /var/www/fluigicad.org/jobs/tmp__626343abb92a3d0017915574/variable_volume_mixer.mint
Creating the output directory:
line 5:0 token recognition error at: '/'
line 5:1 token recognition error at: '/'
line 8:0 token recognition error at: '/'
line 8:1 token recognition error at: '/'
line 11:0 token recognition error at: '/'
line 11:1 token recognition error at: '/'
line 12:0 token recognition error at: '/'
line 12:1 token recognition error at: '/'
line 13:0 token recognition error at: '/'
line 13:1 token recognition error at: '/'
line 13:30 token recognition error at: '-'
line 14:0 token recognition error at: '/'
line 14:1 token recognition error at: '/'
line 18:0 token recognition error at: '/'
line 18:1 token recognition error at: '/'
line 18:26 token recognition error at: '/'
line 21:0 token recognition error at: '/'
line 21:1 token recognition error at: '/'
line 21:11 token recognition error at: '-'
line 22:0 token recognition error at: '/'
line 22:1 token recognition error at: '/'
line 26:0 token recognition error at: '/'
line 26:1 token recognition error at: '/'
line 30:0 token recognition error at: '/'
line 30:1 token recognition error at: '/'
line 35:0 token recognition error at: '/'
line 35:1 token recognition error at: '/'
line 36:0 token recognition error at: '/'
line 36:1 token recognition error at: '/'
line 43:0 token recognition error at: '/'
line 43:1 token recognition error at: '/'
line 43:41 token recognition error at: '+'
line 44:0 token recognition error at: '/'
line 44:1 token recognition error at: '/'
line 45:0 token recognition error at: '/'
line 45:1 token recognition error at: '/'
line 46:0 token recognition error at: '/'
line 46:1 token recognition error at: '/'
line 53:0 token recognition error at: '/'
line 53:1 token recognition error at: '/'
line 5:3 no viable alternative at input 'Input'
line 5:8 extraneous input 'reserviors' expecting {'SET', WS}
line 6:0 extraneous input 'PORT' expecting WS
line 6:5 mismatched input 'input_A' expecting 'SET'
line 6:12 extraneous input ',' expecting WS
line 6:14 mismatched input 'input_B' expecting 'SET'
line 6:21 extraneous input ',' expecting WS
line 6:23 mismatched input 'input_C' expecting 'SET'
line 6:30 extraneous input ',' expecting WS
line 6:32 mismatched input 'input_D' expecting 'SET'
line 6:39 extraneous input ',' expecting WS
line 6:41 mismatched input 'input_D' expecting 'SET'
line 6:48 extraneous input ',' expecting WS
line 6:50 mismatched input 'input_E' expecting 'SET'
line 6:58 mismatched input 'r' expecting 'SET'
line 6:59 mismatched input '=' expecting WS
line 8:9 mismatched input 'reservoirs' expecting 'SET'
line 9:0 extraneous input 'PORT' expecting WS
line 9:5 mismatched input 'output_X' expecting 'SET'
line 9:13 extraneous input ',' expecting WS
line 9:15 mismatched input 'output_Y' expecting 'SET'
line 9:23 extraneous input ',' expecting WS
line 9:25 mismatched input 'output_Z' expecting 'SET'
line 9:34 mismatched input 'r' expecting 'SET'
line 9:35 mismatched input '=' expecting WS
line 11:8 mismatched input 'connecting' expecting 'SET'
line 11:19 mismatched input 'the' expecting 'SET'
line 11:23 mismatched input 'input' expecting 'SET'
line 11:29 mismatched input 'reservoirs' expecting 'SET'
line 11:40 mismatched input 'for' expecting 'SET'
line 11:44 mismatched input 'the' expecting 'SET'
line 11:48 mismatched input 'different' expecting 'SET'
line 12:2 extraneous input 'mixing' expecting WS
line 12:9 mismatched input 'combinations' expecting 'SET'
line 13:2 extraneous input 'mi_l' expecting WS
line 13:7 mismatched input 'is' expecting 'SET'
line 13:10 mismatched input 'the' expecting 'SET'
line 13:14 mismatched input 'left' expecting 'SET'
line 13:19 mismatched input 'node' expecting 'SET'
line 13:24 extraneous input 'of' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 13:27 mismatched input 'mix' expecting 'SET'
line 13:31 extraneous input 'incubator' expecting WS
line 13:41 mismatched input 'complex' expecting 'SET'
line 14:2 extraneous input 'mi_r' expecting WS
line 14:7 mismatched input 'is' expecting 'SET'
line 14:10 mismatched input 'right' expecting 'SET'
line 14:16 mismatched input 'node' expecting 'SET'
line 14:21 extraneous input 'of' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 14:24 mismatched input 'the' expecting 'SET'
line 14:28 mismatched input 'complex' expecting 'SET'
line 15:0 extraneous input 'PORT' expecting WS
line 15:5 mismatched input 'node_ae' expecting 'SET'
line 15:12 extraneous input ',' expecting WS
line 15:14 mismatched input 'node_bcd' expecting 'SET'
line 15:23 mismatched input 'r' expecting 'SET'
line 15:24 mismatched input '=' expecting WS
line 18:7 mismatched input 'following' expecting 'SET'
line 18:17 mismatched input 'the' expecting 'SET'
line 18:21 mismatched input 'mixer' expecting 'SET'
line 18:27 extraneous input 'incubator' expecting WS
line 18:37 mismatched input 'complex' expecting 'SET'
line 19:0 extraneous input 'PORT' expecting WS
line 19:5 mismatched input 'post_mixing' expecting 'SET'
line 19:17 mismatched input 'r' expecting 'SET'
line 19:18 mismatched input '=' expecting WS
line 21:12 extraneous input 'mixer' expecting WS
line 21:18 mismatched input 'complex' expecting 'SET'
line 21:26 mismatched input 'where' expecting 'SET'
line 21:32 mismatched input 'the' expecting 'SET'
line 21:36 mismatched input 'incubator' expecting 'SET'
line 21:46 mismatched input 'is' expecting 'SET'
line 21:49 mismatched input 'a' expecting 'SET'
line 21:51 mismatched input 'MIXER' expecting 'SET'
line 22:10 extraneous input 'length' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 22:17 mismatched input 'with' expecting 'SET'
line 22:22 mismatched input 'one' expecting 'SET'
line 22:26 mismatched input 'more' expecting 'SET'
line 22:31 mismatched input 'bend' expecting 'SET'
line 23:0 extraneous input 'H' expecting WS
line 23:2 mismatched input 'MIXER' expecting 'SET'
line 26:11 mismatched input 'for' expecting 'SET'
line 26:15 mismatched input 'input' expecting 'SET'
line 26:21 mismatched input 'reservoirs' expecting 'SET'
line 26:32 mismatched input 'a' expecting 'SET'
line 26:33 mismatched input ',' expecting WS
line 26:36 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 26:39 mismatched input 'first' expecting 'SET'
line 26:45 mismatched input 'node' expecting 'SET'
line 27:0 extraneous input 'CHANNEL' expecting WS
line 27:8 mismatched input 'a_output' expecting 'SET'
line 27:17 extraneous input 'from' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 27:22 mismatched input 'input_A' expecting 'SET'
line 27:30 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 27:33 mismatched input 'node_ae' expecting 'SET'
line 27:40 mismatched input ';' expecting WS
line 30:11 mismatched input 'for' expecting 'SET'
line 30:15 mismatched input 'input' expecting 'SET'
line 30:21 mismatched input 'reservoirs' expecting 'SET'
line 30:32 mismatched input 'b' expecting 'SET'
line 30:33 mismatched input ',' expecting WS
line 30:35 mismatched input ',' expecting WS
line 30:38 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 30:41 mismatched input 'first' expecting 'SET'
line 30:47 mismatched input 'node' expecting 'SET'
line 31:0 extraneous input 'CHANNEL' expecting WS
line 31:8 mismatched input 'b_ouput' expecting 'SET'
line 31:16 extraneous input 'from' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 31:21 mismatched input 'input_B' expecting 'SET'
line 31:29 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 31:32 mismatched input 'node_bcd' expecting 'SET'
line 31:40 mismatched input ';' expecting WS
line 35:11 mismatched input 'channels' expecting 'SET'
line 35:20 mismatched input 'along' expecting 'SET'
line 35:26 mismatched input 'with' expecting 'SET'
line 35:31 mismatched input 'their' expecting 'SET'
line 35:37 mismatched input 'valves' expecting 'SET'
line 35:44 mismatched input 'allow' expecting 'SET'
line 35:50 mismatched input 'for' expecting 'SET'
line 36:2 extraneous input 'every' expecting WS
line 36:8 mismatched input 'possible' expecting 'SET'
line 36:17 mismatched input 'mix' expecting 'SET'
line 36:21 mismatched input 'combo' expecting 'SET'
line 36:27 extraneous input 'of' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 36:30 extraneous input '5' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 36:32 mismatched input 'initial' expecting 'SET'
line 36:40 mismatched input 'liquids' expecting 'SET'
line 38:0 extraneous input 'CHANNEL' expecting WS
line 38:8 mismatched input 'node_connect' expecting 'SET'
line 38:21 extraneous input 'from' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 38:26 mismatched input 'node_bcd' expecting 'SET'
line 38:35 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 38:38 mismatched input 'node_ae' expecting 'SET'
line 38:45 mismatched input ';' expecting WS
line 43:11 mismatched input 'for' expecting 'SET'
line 43:15 mismatched input 'the' expecting 'SET'
line 43:19 mismatched input 'entire' expecting 'SET'
line 43:26 mismatched input 'route' expecting 'SET'
line 43:32 extraneous input 'of' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 43:35 mismatched input 'mixing' expecting 'SET'
line 43:42 mismatched input 'incubation' expecting WS
line 44:2 extraneous input 'once' expecting WS
line 44:7 mismatched input 'sensor' expecting 'SET'
line 44:14 mismatched input 'paired' expecting 'SET'
line 44:21 mismatched input 'with' expecting 'SET'
line 44:26 mismatched input 'microfluidic' expecting 'SET'
line 44:39 mismatched input 'device' expecting 'SET'
line 44:46 mismatched input 'reaches' expecting 'SET'
line 45:2 mismatched input 'threshold' expecting WS
line 45:11 extraneous input ',' expecting WS
line 45:13 mismatched input 'direct' expecting 'SET'
line 45:20 mismatched input 'route' expecting 'SET'
line 45:26 mismatched input 'channel' expecting 'SET'
line 45:34 mismatched input 'is' expecting 'SET'
line 45:37 mismatched input 'taken' expecting 'SET'
line 45:43 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 45:46 mismatched input 'proceed' expecting 'SET'
line 45:54 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 46:2 mismatched input 'output' expecting 'SET'
line 46:9 mismatched input 'reservoirs' expecting 'SET'
line 47:0 mismatched input 'CHANNEL' expecting 'SET'
line 53:9 mismatched input 'channels' expecting 'SET'
line 53:18 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 53:21 extraneous input '3' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 53:23 mismatched input 'different' expecting 'SET'
line 53:33 mismatched input 'output' expecting 'SET'
line 53:40 mismatched input 'reservoirs' expecting 'SET'
line 54:0 extraneous input 'CHANNEL' expecting WS
line 54:8 mismatched input 'p_mix' expecting 'SET'
line 54:14 extraneous input 'from' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 54:19 mismatched input 'mi_r' expecting 'SET'
line 54:24 extraneous input 'to' expecting {<EOF>, 'LAYER FLOW', 'END LAYER', 'LAYER CONTROL', 'LAYER INTEGRATION', 'BANK', 'GRID', 'NODE', 'TERMINAL', 'CHANNEL', 'NET', 'SET', 'V', 'H', ID, ID_BIG, WS}
line 54:27 mismatched input 'post_mixing' expecting 'SET'
line 54:38 mismatched input ';' expecting WS
STOPPED: Syntax Error(s) Found
