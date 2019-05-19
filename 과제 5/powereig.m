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
## @deftypefn {} {@var{retval} =} powereig (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-11-15

function [evect, eval] = powereig (A,es,maxit)
n=length(A);
evect=ones(n,1);eval=1;iter=0;ea=100;
while(1)
  evalold=eval;
  evect=A*evect;
  eval=max(abs(evect));
  evect=evect./eval;
  iter=iter+1;
  if eval~=0, ea = abs((eval-evalold)/eval)*100; end
  if ea<=es | iter >= maxit,break,end
end