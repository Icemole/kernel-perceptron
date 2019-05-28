% Classifier function.
function value = classifier( x, kernel, alphas, classes )
	newAlphas = alphas;
	negativeClasses = find( classes < 0 );
	newAlphas( negativeClasses ) = -newAlphas( negativeClasses );
	value = newAlphas' * kernel( :, x )
	value += sum( newAlphas )
endfunction

sep = "------------------------";

dimensions = input( "Number of dimensions of each sample: " );
numSamples = input( "Number of samples: " );
printf( "%s\n", sep );

kernel = [25 1 9 9; 1 4 0 1; 9 0 9 4; 9 1 4 4];
alphas = [0; 0; 0; 0];
classes = [1; -1; 1; -1];

% Sample matrix. Its structure is as follows:
% 
% - Every row is a sample.
% - Every column is the sample's value on the
% dimension given by the column.
% samples = zeros( numSamples, dimensions );
% Define it now if you do not want to be asked for it later.


% Class vector. The i-th element corresponds to
% the class to which the i-th sample belongs.
% classes = zeros( numSamples, 1 );
% Define it here if you do not want to be asked for it later.


% Alpha (learning rate) coefficients. The i-th
% element corresponds to the learning rate of
% the classifier with respect to the i-th sample.
% alphas = zeros( numSamples, 1 );
% Define it now if you do not want to be asked for it later.


% Gramm matrix. It corresponds to the values of the
% kernel function of every sample with respect to
% each other, so that the ( i, j )-th position of the
% matrix is the value of K( i, j ).
% kernel = zeros( numSamples, numSamples );
% Define it now if you do not want to be asked for it later.


% Filling sample matrix.
if ( exist( "samples", "var" ) != 1 )
	for i = 1 : numSamples
		printf( "\nSAMPLE %d\n", i );
		for j = 1 : dimensions
			printf( "Dimension %d: ", i );
			samples( i, j ) = input( "" );
		endfor
		printf( "Sample class: " );
		class( i ) = input( "" );
	endfor
endif

% Filling alpha coefficients.
if( exist( "alphas", "var" ) != 1 )
	printf( "\n\n%s\n", sep );
	printf( "Alpha coefficients\n\n" );
	for i = 1 : numSamples
		printf( "Alpha of sample number %d: ", i );
		alphas( i ) = input( "" );
	endfor
endif

% Filling Kernel matrix.
	if( exist( "kernel", "var" ) != 1 )
	printf( "\n\n%s\n", sep );
	printf( "Proceeding to fill the Kernel matrix...\n" );
	if yes_or_no( "Is the matrix symmetric? " )
		% The matrix is symmetric. We need to ask less values.
		for i = 1 : numSamples
			for j = 1 : i
				printf( "K( sample_%d, sample_%d ) = ", i, j );
				kernel( i, j ) = input( "" );
				kernel( j, i ) = kernel( i, j );
			endfor
		endfor
	else
		% The matrix is not symmetric. Ask for more values.
		for i = 1 : numSamples
			for j = 1 : numSamples
				printf( "K( sample_%d, sample_%d ) = ", i, j );
				kernel( i, j ) = input( "" );
			endfor
		endfor
	endif
	printf( "Kernel matrix filled.\n\n" );
endif

% Beginning of the Kernel-Perceptron algorithm.
printf( "Starting Kernel-Perceptron algorithm...\n" );
correctlyClassified = 0;
iteration = 0;
while( correctlyClassified < numSamples )
	printf( "%s\n", sep );
	printf( "ITERATION %d\n\n", iteration );
	correctlyClassified = 0;
	% Sadly, this for loop cannot be optimized through
	% the usage of matrix multiplications because
	% the values of alpha will possibly be changing
	% throughout the iterations.
	for i = 1 : numSamples
		val = classifier( i, kernel, alphas, classes );
		if( classes( i ) * val <= 0 )
			alphas( i )++;
		else
			correctlyClassified++;
		endif
		printf( "Alpha vector at the end of this iteration:\n" );
		alphas
	endfor
	iteration++;
	printf( "Total number of errors: %d\n\n", (numSamples - correctlyClassified) );
endwhile

