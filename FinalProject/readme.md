The file `demo_11blades.wpa` contains a 3-D blade design similar to that used to obtain the provided "demo" experimental data. You should modify the file by creating the polars at the values of the Reynolds number based on the chord length Re_c that you calculate from the data.

The file `demo_11blades_expdata.csv` contains the experimental data obtained with this rotor blade. The columns are as follows:
- `velocity` gives the free-stream velocity in the wind tunnel, in m/s
- `position` gives the position of the dial on the generator that controls the resistance; you don't need to use this column
- `frequency` gives the measured frequency of the turbine rotation, in revolutions/second
- `voltage` gives the measured voltage difference across the generator, in volts
- `resistance` gives the resistance of the generator (as set by the knob position), in ohms

The radius of the blade is 8 cm, and the typical chord length is 2 cm.
