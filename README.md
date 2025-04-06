# Parameterisation-of-Ear-EEG
This repository provides MATLAB scripts for the application of FOOOF (Donoghue et al., 2020) to ear-EEG in the context of a thesis. The aim of the thesis was to characterise the periodic and aperiodic activity of single-channel ear-EEG.

For adequate functioning of the scripts and correct analysis, the scripts should be run in the following order:

      1.	PreProcessing_AlphaBlock.mlx and PreProcessing_RestingState.mlx
      
      2.	FOOOF_tuning.mlx
      
      3.	FOOOFImplementation.mlx
      
      4.	PostFOOOF_StatisticalAnalysis.mlx

Moreover, information regarding each script (aim, function, steps) is provided within the files, prior to the code. Likewise, all scripts are commented.

This work implements FOOOF using the FOOOF Matlab wrapper (Donoghue et al., 2020), accessible at the following link: https://github.com/fooof-tools/fooof_mat. The functions used by the scripts for this study (and obtained from the latter) have been included in the 'FOOOF_MAT' folder. Two new functions were created: the script ‘fooof_db’ was created to convert relevant FOOOF outputs, such as periodic power, to decibels. This was to allow for comparison with the pre-FOOOF parameters. This file was also added to this folder. An extension of the 'fooof_plot.m' script was made to plot multiple PSDs on one Figure - this has been added to this folder in this repository and named 'fooof_plot2.m'.


