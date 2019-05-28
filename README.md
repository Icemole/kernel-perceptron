# kernel-perceptron
Kernel-Perceptron algorithm implemented in Octave.

## Short description
This algorithm uses a Kernel function as a projection to a bigger number of variables. This is usually done in order to find a classifier which linearly separates samples that could not have been linearly separated in the original representation dimensions.

The program uses the variables `samples` (sample matrix, every row corresponds to a sample), `kernel` (Kernel or Gramm matrix), `alphas` (learning rate associated to every sample) and `classes` (class associated to every sample). If you know every value a priori, it is advised to fill them at the beginning of the code.
In fact, the variable `samples` is not used at all; it should be used on the filling of `kernel` when given the Gramm matrix as a function of two samples, but that is not implemented yet.

The program also uses a variable `verbosity` which, if true, prints the steps performed at each classification. It is recommended to turn this off since the prints are made with a `for` loop and no actual computation is performed there, but it could be turned on for problems with few dimensions or in which the steps need to be shown.

## Usage
The command `$ octave kernel-perceptron` will start the program. If you have not defined the corresponding variables inside the code, the program will guide you through some inputs that you will need to type, just follow them. It is recommended to type the parameters in the code once the number of samples starts getting bigger (in a Gramm matrix with 5 samples you should type in 15 parameters of the matrix every time you start the program, which is no bueno for you).
