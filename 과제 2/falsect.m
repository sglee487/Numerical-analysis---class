## Copyright (C) 2017 ngun
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} falsect (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-09-23

function [root, fx, ea, iter] = falsect (func, xl, xu, es, maxit, varargin)
  %based on bisect. p150
  
  if nargin<3,error('at least 3 input arguments required'),end
  test = func(xl,varargin{:})*func(xu,varargin{:});
  if test>0, error('no sign change'),end
  if nargin<4 | isempty(es), es=0.0001;end
  if nargin<5 | isempty(maxit), maxit=50;end
  iter = 0; xr = xl; ea = 100;
  while (1)
    xrold = xr;
    %xr = (xl + xu)/2;
    xr = (xu)-((func(xu,varargin{:})*(xl-xu))/(func(xl,varargin{:}) - func(xu,varargin{:})));
    iter = iter + 1;
    if xr ~= 0, ea = abs((xr - xrold)/xr)* 100;end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test < 0
      xu = xr;
    else if test > 0
      xl = xr;
      else
      ea = 0;
      end
      if ea <= es | iter >= maxit,break,end
        end
        root = xr; fx = func(xr, varargin{:});

end
