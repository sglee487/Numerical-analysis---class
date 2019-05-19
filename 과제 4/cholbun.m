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
## @deftypefn {} {@var{retval} =} cholbun (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-10-22

function [U] = cholbun (A)
if size(A,1) ~= size(A,2) error ('no') end
U(1,1) = sqrt(A(1,1));
for i = 2:size(A,2)
  U(1,i) = A(1,i)/U(1,1);

for i = 2:size(A,1)
  for j = i:size(A,1)
    if i == j
      U(i,j) = sqrt(A(i,j) - symsum(U(k,i)^2,k,1,i-1));
    else
      U(i,j) = (A(i,j)-symsum(U(k,i)*U(k,j), k, 1, i-1));
    end
  end
end
end