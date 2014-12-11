VHDL-Audio-Synth
================

This is for a Final project in my Digital Logic class. I initially wanted to create some type of synthesizer
or at least the stepping blocks toward a synthesizer utilizing VHDL and the Papilio One FPGA.

It didn't take long for me to realize I needed to start small. The end result of this project is really just an
Audio Mux that can play 8 sound samples "simultaneously"

This project makes heavy use of the Xilinx IP Cores for the block memory. My 8 audio samples come from 8 memory
blocks of ROM loaded with COE files. These 8 files were intended to represent an octave starting at the A beneath 
Middle C.

What really needs to be touched up on this project are the COE files. I've included the Excel document that I used to
create a list of values that represent points along the first half period of a sine wave rounded to the nearest integer.

Because these values are sooo small... after rounding to the nearest integer, a good few of the notes sound nearly identical :(

I doubt that I will be keeping up with this project much after the semester is over, but it sure has been fun and a great into
to FPGAs and VHDL

-- CCarrera8942
-- 2014DEC10
