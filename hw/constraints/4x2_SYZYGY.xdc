## SYZYGY
## THE DIFFERENTIAL SIGNALS MAY ALSO BE USED AS SINGLE ENDED
## SO BOTH THE P AND N SIDES  ARE LISTED
## UPDATED AUG11 2021 TO REFLECT PIN SWAPS

set_property PACKAGE_PIN AU2 [ get_ports "SYZYGY_D0_P" ]

set_property PACKAGE_PIN AU1 [ get_ports "SYZYGY_D0_N" ]

set_property PACKAGE_PIN A7 [ get_ports "SYZYGY_D1_P" ]

set_property PACKAGE_PIN A6 [ get_ports "SYZYGY_D1_N" ]

set_property PACKAGE_PIN AV3 [ get_ports "SYZYGY_D2_P" ]

set_property PACKAGE_PIN AV2 [ get_ports "SYZYGY_D2_N" ]

set_property PACKAGE_PIN C8 [ get_ports "SYZYGY_D3_P" ]

set_property PACKAGE_PIN C7 [ get_ports "SYZYGY_D3_N" ]

set_property PACKAGE_PIN AW4 [ get_ports "SYZYGY_D4_P" ]

set_property PACKAGE_PIN AW3 [ get_ports "SYZYGY_D4_N" ]

set_property PACKAGE_PIN E9 [ get_ports "SYZYGY_D5_P" ]

set_property PACKAGE_PIN E8 [ get_ports "SYZYGY_D5_N" ]

set_property PACKAGE_PIN AT7 [ get_ports "SYZYGY_D6_P" ]

set_property PACKAGE_PIN AT6 [ get_ports "SYZYGY_D6_N" ]

set_property PACKAGE_PIN F6 [ get_ports "SYZYGY_D7_P" ]

set_property PACKAGE_PIN E6 [ get_ports "SYZYGY_D7_N" ]



set_property PACKAGE_PIN B8 [ get_ports "SYZYGY_S16" ]

set_property PACKAGE_PIN D6 [ get_ports "SYZYGY_S18" ]

set_property PACKAGE_PIN C6 [ get_ports "SYZYGY_S20" ]

set_property PACKAGE_PIN B5 [ get_ports "SYZYGY_S22" ]

set_property PACKAGE_PIN A5 [ get_ports "SYZYGY_S24" ]

set_property PACKAGE_PIN C5 [ get_ports "SYZYGY_S26" ]


set_property PACKAGE_PIN AR6 [ get_ports "SYZYGY_S17" ]

set_property PACKAGE_PIN AR7 [ get_ports "SYZYGY_S19" ]

set_property PACKAGE_PIN AU7 [ get_ports "SYZYGY_S21" ]

set_property PACKAGE_PIN AV7 [ get_ports "SYZYGY_S23" ]

set_property PACKAGE_PIN AU8 [ get_ports "SYZYGY_S25" ]

set_property PACKAGE_PIN AV8 [ get_ports "SYZYGY_S27" ]


set_property PACKAGE_PIN AV6 [ get_ports "SYZYGY_P2C_CLK_P" ]

set_property PACKAGE_PIN B10 [ get_ports "SYZYGY_C2P_CLK_P" ]


## THE IO STANDARD IS DETERMINED BY THE SETTING OF VCCPSYZYGY
## SO MODIFY THE LINES BELOW TO REFLECT THE ACTUAL IO STANDARD
set_property IOSTANDARD LVCMOS18 [ get_ports "SYZYGY_S*"]
set_property IOSTANDARD LVCMOS18 [ get_ports "SYZYGY_D*"]
set_property IOSTANDARD LVCMOS18 [ get_ports "SYZYGY_P2C_CLK_P"]
set_property IOSTANDARD LVCMOS18 [ get_ports "SYZYGY_C2P_CLK_P"]

set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]


