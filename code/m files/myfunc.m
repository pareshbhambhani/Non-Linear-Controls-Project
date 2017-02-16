function [sys,x0,str,ts] = myfunc(t,x,u,flag)
% MYFUNC An example M-file S-function for defining a 
% nonlinear time-varying state space system of the form:
%
%	 dx/dt = f(x,u,t)
%	     y = g(x,u,t)
%   
%   See sfuntmpl.m for a general S-function template.
%   See csfunc.m for a linear system implementation.

%   Edited version of csfunc.m
%   Copyright (c) 1990-97 by The MathWorks, Inc.
%   $Revision: 1.4 $

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;

  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(x,u,t);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(x,u,t);

  %%%%%%%%%%%%%%%%%%%
  % Unhandled flags %
  %%%%%%%%%%%%%%%%%%%
  case { 2, 4, 9 },
    sys = [];

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end
% end myfunc

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;

sizes.NumContStates  = 1; 	% ENTER state dimension 
sizes.NumOutputs     = 1; 	% ENTER output dimension 
sizes.NumInputs      = 0; 	% ENTER input dimension 

sizes.NumDiscStates  = 0;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
str = [];
ts  = [0 0];

x0  = 0;  			% ENTER initial conditions 

% end mdlInitializeSizes
%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================
%
function sys=mdlDerivatives(x,u,t)

sys = 1 + x^2 ;  		% ENTER state equation 

% end mdlDerivatives
%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(x,u,t)

sys = x;  			% ENTER output equation 

% end mdlOutputs

