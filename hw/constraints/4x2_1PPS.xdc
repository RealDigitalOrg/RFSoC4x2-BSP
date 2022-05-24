## 1PPS INTERFACE

set_property PACKAGE_PIN AK13 [ get_ports "IRIG_ADC_SDO" ]
set_property PACKAGE_PIN AH12 [ get_ports "IRIG_ADC_SCLK" ]
set_property PACKAGE_PIN AH13 [ get_ports "IRIG_TRIG_OUT" ]
set_property PACKAGE_PIN AJ13 [ get_ports "IRIG_COMP_OUT" ]
set_property PACKAGE_PIN AG14 [ get_ports "IRIG_ADC_CS_N" ]
set_property IOSTANDARD LVCMOS18 [ get_ports "IRIG*"]


set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]


