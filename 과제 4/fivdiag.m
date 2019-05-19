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
## @deftypefn {} {@var{retval} =} fivdiag (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-10-22

function [x] = fivdiag (d,e,f,g,h,r)
n=length(f);

for k = 3:n
  factor = d(k)/f(k-2);
  e(k) = e(k) - factor*g(k-2);
  f(k) = f(k) - factor*h(k-2);
  r(k) = r(k) - factor*r(k-2);
end
e,f,g,h,r
for k = 2:n
  factor = e(k)/f(k-1);
  f(k) = f(k) - factor*g(k-1);
  g(k) = g(k) - factor*h(k-1);
  r(k) = r(k) - factor*r(k-1);

end
f,g,h,r
x(n) = r(n)/f(n);
x(n-1) = (r(n-1) - g(n-1)*x(n))/f(n-1);
for k= n-2:-1:1
  x(k) = (r(k) - g(k)*x(k+1)-h(k)*x(k+2))/f(k);
end