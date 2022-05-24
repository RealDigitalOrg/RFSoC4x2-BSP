## USER LEDS
set_property PACKAGE_PIN AR11 [ get_ports "W_LED_0" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "W_LED_0" ]

set_property PACKAGE_PIN AW10 [ get_ports "W_LED_1" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "W_LED_1" ]

set_property PACKAGE_PIN AT11 [ get_ports "W_LED_2" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "W_LED_2" ]

set_property PACKAGE_PIN AU10 [ get_ports "W_LED_3" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "W_LED_3" ]

set_property PACKAGE_PIN AM8 [ get_ports "R_LED_0" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "R_LED_0" ]

set_property PACKAGE_PIN AM7 [ get_ports "G_LED_0" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "G_LED_0" ]

set_property PACKAGE_PIN AN8 [ get_ports "B_LED_0" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "B_LED_0" ]

set_property PACKAGE_PIN AR12 [ get_ports "R_LED_1" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "R_LED_1" ]

set_property PACKAGE_PIN AP8 [ get_ports "G_LED_1" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "G_LED_1" ]

set_property PACKAGE_PIN AT10 [ get_ports "B_LED_1" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "B_LED_1" ]


## USER PUSH BUTTON
set_property PACKAGE_PIN AV12 [ get_ports "PB_0" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "PB_0" ]

set_property PACKAGE_PIN AV10 [ get_ports "PB_1" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "PB_1" ]

set_property PACKAGE_PIN AW9 [ get_ports "PB_2" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "PB_2" ]

set_property PACKAGE_PIN AT12 [ get_ports "PB_3" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "PB_3" ]

set_property PACKAGE_PIN AN12 [ get_ports "PB_4" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "PB_4" ]

## USER SLIDE SWITCH
set_property PACKAGE_PIN AN13 [ get_ports "SW_0" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "SW_0" ]

set_property PACKAGE_PIN AU12 [ get_ports "SW_1" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "SW_1" ]

set_property PACKAGE_PIN AW11 [ get_ports "SW_2" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "SW_2" ]

set_property PACKAGE_PIN AV11 [ get_ports "SW_3" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "SW_3" ]


set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]


