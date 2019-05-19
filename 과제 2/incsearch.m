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
## @deftypefn {} {@var{retval} =} incsearch (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-09-24

function [xb] = incsearch (func,xmin,xmax,ns)
  % p142

  if nargin < 3, error('at least 3 arguments required'), end
  if nargin < 4, ns = 50; end
    
  x = linspace(xmin,xmax,ns);
  f = func(x);
  nb = 0; xb = [];
  for k = 1:length(x)-1
    if sign(f(k)) ~= sign(f(k+1))
      nb = nb + 1;
      xb(nb,1) = x(k);
      xb(nb,2) = x(k+1);
    end
  end
  if isempty(xb)
    disp('no brackets found')
    disp('check interval or increase ns')
  else
    disp('number of brackets: ')
    disp(nb)
  end
end
