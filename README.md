Time efficient MATLAB algorithms for processing large amounts of data: audio handling, signal processing, automated movement and database parsing

Mara Gheorghe, Politehnica University of Bucharest

** The automatic checker and the suite of inputs and tests were provided by the Numerical Methods team

Task 1 - Numerical Music*
Description: this task aims to be an introduction to signal processing and visual representation of audio data
	stereo_to_mono.m -> takes in a matrix representing a signal with multiple channels (a stereo signal) and returns a column vector of the mean values for each line in the matrix.
	spectrogram.m -> takes in the signal, sampling rate and the window size. It returns three values: the spectrogram matrix, the frequency vector and the time vector used when "drawing" the matrix. It can be used to create a visual representation of the audio data in a file, to easily visualise how high or how low the frequency gets with time.
	oscillator.m -> takes as parameters the frequency of the sine wave, the duration of the created sound, the sampling rate and the envelope that describes how the amplitude of the sound changes over time. The envelope is quite usual, containing data about the attack, decay, sustain and release of the sound. The function returns the generated sine wave as a column vector.
	low_pass.m -> takes a signal, a sampling rate and a cutoff frequency 'fc'. The Fourier coefficients corresponding to the frequencies higher than fc are set to 0 them the inverse Fourier transforma is applied to obtain the filtered signal.
	apply_reverb.m -> takes as parameters the signal, and the impulse response. It returns the signal with the impulse response applied.

	* All other files in this folder were provided by the Numerical Methods team

Task 2 - Robotzii
Description: this task simulates the pre-calculated movements of an autonomous robot using interpolation methods
	parse_data.m -> the function reads from a specified file the number n, then 2 vectors with n+1 elements each. These vectors represent the coordinates of the interpolation support points.
	spline_c2.m -> takes the abovementioned coordinates, solves the matrix equation A*coef = b that represents all the equations that are available for interpolation with C2 splines. It calculates the matrix A and returns the coefficients column vector.
	p_spline.m -> receives the previously determined matrix of coefficients, the collumn vector x and the abscissa vector x_interp, in which the values of the polynomial P_spline are to be found. It returns a column vector with the value of P_spline in those x_interp points.
	vandermonde.m -> it solves the same matrix equation system as the one in the spline_c2 function, this time using the Vandermonde interpolation method.
	p_vandermonde .m -> the same as p_spline, this time using the Vandermonde polynomial.

Task 3 - Recommendations
Description: this task simulates a system that recommends themes to a customer based on a database of reviews as well as the customer's own preferences
	preprocess.m -> preprocesses the database by removing any all clients (rows) that gave strictly less than a given number of reviews.
	cosine_similarity.m -> takes in two column vectors, normalizes them, and computes the cosine similarity between them.
	read_mat.m -> reads the review database from a ".csv" file
	recommendations.m -> computes the indices of the themes a user would like based on a theme they already like. The V matrix in the reduced SVD of the database contains the information about the themes. Those themes are then sorted based on the similarity with the liked theme, using the cosine_similarity function.


* Extra comments  on the results of the marked spectograms in the studio.m file:
	1. The difference between the "Plain Sound" and the "Plain Loop" spectrograms
		The "Plain Sound" spectrogram shows large sections where no audio is being played. It also has a larger time interval than the other spectrogram. It shows raw, unprocessed sound that is unfit for working with.
		The "Plain Loop" has a shorter time interval, yet every moment in time has some frequencies present. That is because the data has been processed with the create_sound function to remove the inconsistencies and offer an optimal sampling rate for the signal.
		
	2. The difference between the "Plain Sound" and the "Low Pass Sound" spectrograms
		On top not having empty sections, the "Low Pass Sound" spectrogram has all the red concentrated in the very bottom and the yellow is only on top of the red and in some very small time intervals.
		That is because filtering out the higher frequencies means the low frequencies will be much more present than the higher frequencies, hence the bottom red line.

	3. The difference between the "Plain Sound" and the "Reverb Sound" spectrograms
		The  "Reverb Sound" spectrogram has every frequency moderately or very present most of the time.
		Also, the high frequency parts of the signal gradualy turn into lower frequencies untill a new high frequency spike appears and the cycle repeats, unlike the "Plain Sound" spectrogram where high frequencies end abruptly.

	4. The "Tech" spectrogram has a sharp contrast between colours due to the audio sample having a very diverse range of sounds.
	
	5. The "Low Pass Tech" spectrogram has all the red sitting in the bottom because higher frequencies were filtered out so the lower frequencies are much more present.
	
	6. The "Reverb Tech" spectrogram amplifies the warm colours in the original spectrogram and smoothenes the transition between red and yellow since the signal is reverberated.
	
	7. The "Low Pass + Reverb Tech" spectrogram takes the low pass spectrogram and smoothenes out the transition from one colour to another since the filtered signal was reverberated.
	
	8. The "Reverb + Low Pass Tech" spectrogram looks similar to "Low Pass + Reverb Tech", however the end of the signal is a bit smoother since the filter was applied on an already reverberated signal.

