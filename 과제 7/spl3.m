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
## @deftypefn {} {@var{retval} =} spl3 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-12-07

function [yi] = spl3 (xx,yy,xi)
n = length(xx);
h(1:n-1) = xx(2:n) - xx(1:n-1);
T(1:n-1) = (yy(2:n) - yy(1:n-1))./h(1:n-1);
R(2:n-1) = 3*(T(2:n-1) - T(1:n-2));
R(1)=0; R(n)=0; % added (Natural)
U(2:n-1) = h(2:n-1);
U(1)=0; U(n)=0; % added (Natural)
D(2:n-1) = 2*(h(1:n-2) + h(2:n-1));
D(1) =1; D(n)=1;
L(2:n-1) = h(1:n-2);
L(1)=0; L(n)=0; % added (Natural)
c = tridiag(L, D, U, R);
a(1:n-1) = yy(1:n-1);
b(1:n-1) = T(1:n-1) - h(1:n-1).*(2*c(1:n-1) + c(2:n))/3;
d(1:n-1) = (c(2:n)-c(1:n-1))./(3*h(1:n-1));
%print piecewise function and plot it
if xi < xx(1) | xi > xx(n)
error('Interpolation outside range')
end
% binary search
fprintf('\nResulting piecewise function:\n\n');
for i = 1:n-1
s = [sprintf('(%f)+(%f)*(x-(%f))+(%f)*(x-(%f))^2+(%f)*(x-(%f))^3', a(i), b(i), xx(i), c(i),xx(i), d(i),xx(i))]
end
x=xi;
yi = eval(s);
end
