<h1> Math 412 - 001</h1>

This repository will serve as a way to distribute useful code and software for use during the term. 
It will be updated as regularly as I can manage. 


<h2>Matlab</h2>

Matlab is a general purpose mathematics and computing environment sold by MathWorks.
As a UNM Student, you have access to a free download of Matlab with your UNM ID. 
To install it on your personal computing device, follow the instructions found on the UNM IT website [here](http://it.unm.edu/download/). 


<h2>PPlane and DField</h2>

PPlane and Dfield are useful tools which have been written in the Matlab programming language. 
Dfield can be used to visualize the phase line and solutions to one-dimensional dynamical systems.
PPlane is used to visualize the phase plane and solutions/trajectories of two-dimensional systems. 
They provide many other useful functions including but not limited to:
* Visualizing null-clines
* Finding fixed points
* Calculating the Jacobian (and eigenvalues/eigenvectors) at fixed points.
* Calculating "nearly closed" trajectories
* Exporting pictures of the phase plane and trajectories

Both tools can be downloaded from various places on the internet, including the [Matlab File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/). 
However, I do not suggest downloading the PPlane version found there. 
The Matlab programming language has been updated a few times in the past 4 years and PPlane has not. 
This means that using the publicly available PPlane with modern instalations of Matlab will result in errors, which is the main reason I decided to create this repository. 
In this repository you will find a slightly edited version of the PPlane source file. 
I have changed a single line in the PPlane source file to ensure that it works with the most recent versions of Matlab (thanks to user Hil Meijer on the file exchange forums). 
I have tested in on Matlab 2020 and Matlab 2021.
Hopefully it will continue to work for the forseeable future.

<h3>Installing PPlane and DField</h3>

Download one or both files to your local computer where you have Matlab installed. 
It does not matter precisely which folder you place them in, but put them somewhere where that you will remember and they will not get lost in the clutter. 
Open Matlab as you normally would. 
Navigate to the directory where you have saved pplane8.m and dfield.m. 
This can be done one of two ways.
One option is to use commands in the "Command Window".
For example, you could type the command

```matlab
	cd ~/directory/where/pplane/is/located

```
and hit enter. 
Alternately, you could simply click the appropriate folders shown in the "Current Folder" window. 
The bar above the Command Window will show you which directory Matlab considers the "current directory" (shown in the red circle below). 
You will know you're in the correct directory when you see the appropriate files int he "Current Folder" window (shown in the green circle below).

![Alt Text](./directory.png)

Now you simply need to run the command
```matlab
	pplane8
```
and PPlane should fire right up (see screenshot). 
Happy phase-planing!

![Alt Text](./run.png)

