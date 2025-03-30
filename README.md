# Parameterisation-of-Ear-EEG
This repository provides MATLAB scripts for the application of FOOOF (Donoghue et al., 2020) to ear-EEG in the context of a thesis.

For adequate functioning of the scripts and correct analysis, the scripts should be run in the following order:
  1. PreProcessing_AlphaBlock.mlx and PreProcessing_RestingState.mlx
  2. FOOOFImplementation
  3. PostFOOOF_StatisticalAnalysis

Moreover, information regarding each script (aim, function, steps) is provided within the files, prior to the code. Likewise, all code is commented.

This work implements FOOOF using the FOOOF Matlab wrapper (Donoghue et al.), accessible at the following link: https://github.com/fooof-tools/fooof_mat
Scripts within this source's 'fooof_mat' folder were used to implement the algorithm. Likewise, an extension of the 'fooof_plot.m' script was made to plot multiple PSDs on one Figure - this has been added to this folder in this repository and named 'fooof_plot2.m'. 
