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
## @deftypefn {} {@var{retval} =} GaussSeidelR (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-11-02

function [x,ea,iter] = GaussSeidelR (A,b,lambda,es,maxit)
  if nargin<2,error('at least 2 input arguments requried'),end
  if nargin<5|isempty(maxit), maxit=50;end
  if nargin<4|isempty(es), es=0.00001;end
  if nargin<3|isempty(lambda), lambda = 0.5;end
  [m,n] = size(A);
  if m~=n, error('Matrix A must be square'); end
  C = A;
  for i = 1:n
    C(i,i) = 0;
    x(i) = 0;
  end
  x = x';
  for i = 1:n
    C(i,1:n) = C(i,1:n)/A(i,i);
  end
  for i = 1:n
    d(i) = b(i)/A(i,i);
  end
  iter = 0;
  while (1)
    xold = x;
    for i = 1:n
      x(i) = d(i)-C(i,:)*x;
      x(i) = lambda*x(i) + (1-lambda)*xold(i);
      if x(i) ~= 0
        ea(i) = abs((x(i) - xold(i))/x(i)) * 100;
      end
    end
    iter = iter + 1;
    if max(ea) <= es | iter >= maxit, break, end
  end