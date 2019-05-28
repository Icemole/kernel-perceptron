# kernel-perceptron
Kernel-Perceptron algorithm implemented in Octave.

## Short description
This algorithm uses a Kernel function as a projection to a bigger number of variables. This is usually done in order to find a classifier which linearly separates samples that could not have been linearly separated in the original representation dimensions.

The program uses the variables `samples` (sample matrix, every row corresponds to a sample), `kernel` (Kernel or Gramm matrix), `alphas` (learning rate associated to every sample) and `classes` (class associated to every sample). If you know every value a priori, it is advised to fill them at the beginning of the code.
In fact, the variable `samples` is not used at all; it should be used on the filling of `kernel` when given the Gramm matrix as a function of two samples, but that is not implemented yet.

## Usage
Type this in your terminal: `$ octave kernel-perceptron.m`
