# Data files:

 -The following are the data of depolarization for each LED source. The first column is the optical 
  path difference, in micrometers, introduced by the liquid crystal and the second column is the
  degree of polarization measured with the polarimeter PAX5710VIS-TXP (Thorlabs, inc):

	"red_LED_depolarization_data.xlsx"
	"white_LED_depolarization_data.xlsx"


 -The following are the data of the spectrum for each LED source. It contains wavelenght vs. relative intensity.
  This kind of files can only be opened and procesed using MATLAB or Microsoft Access

	"red_LED_spectrum_data.mat"
	"white_LED_spectrum_data.mat"


------------------------------------------------------------------------------------------------------------------


# Fitting method files:

  -The following are the files that contains the method of fitting that we use to find an exact expression
   for the power spectral density function of each light source. This kind of files can only be opened with the
   MATLAB APP "Curve Fitter".

	"white_LED_spectrum_fitting.sfit"
	"red_LED_spectrum_fitting.sfit"

------------------------------------------------------------------------------------------------------------------

# Graphic code file

  -The following are the file that contains the code for the depolarization experiment graphics that compares
   the measured degree of polarization with the the first and second-order degree of polarization. In this code we
   performed the fourier transform of the power spectral density in order to obtain the degree of coherence of each
   light source and the adjustments of the "a" and "b" constants. This kind of file can only be opened using 
   MATLAB; it is MATLAB code.

	"graphic.m"