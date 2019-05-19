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
## @deftypefn {} {@var{retval} =} lubun (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-10-22

function [L,U] = lubun (A)
if size(A,1) ~= 3 || size(A,2) ~= 3
  error ('no') end
L = [1 0 0; (A(2,1)/A(1,1)) 1 0; (A(3,1)/A(1,1)) ((A(3,2) - (A(3,1)*A(1,2)/A(1,1)))/(A(2,2)-(A(2,1)*A(1,2)/A(1,1)))) 1];
U = [A(1,1) A(1,2) A(1,3); 0 (A(2,2) - (L(2,1)*A(1,2))) (A(2,3) - (L(3,1)*A(1,3))); 0 0 (A(3,3) - (L(3,1)*A(1,3))-(((A(3,2) - (L(3,1)*A(1,2)))/(A(2,2) - (L(2,1)*A(1,2))))*(A(2,3) - (L(2,1)*A(1,2))))) ];
end