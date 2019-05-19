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
## @deftypefn {} {@var{retval} =} echabo (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ngun <ngun@DESKTOP-ENA6JFB>
## Created: 2017-10-02

function [x,fx,ea,iter] = echabo (f,xl,xu,es,maxit,varargin)
  % based on goldmin. p.205
  
  if nargin<3,error('at least 3 input arguments required'),end
  if nargin<4|isempty(es), es=0.0001;end
  if nargin<5|isempty(maxit), maxit=50;end
  phi = (1+sqrt(5))/2;
  iter = 0;
  xcho = (xl+xu)/2;
  if f(xl,varargin{:}) < f(xcho,varargin{:}) | f(xu,varargin{:}) < f(xcho,varargin{:})
    error('not lowest in xl xu'),end
  while(1)
    %d = (phi-1)*(xu-xl);
    %x1 = xl + d;
    %x2 = xu - d;
    x1 = xl;
    x3 = xu;
    x2 = xcho;
    x4 = x2 - (1/2)*(((x2-x1)^2*(f(x2,varargin{:})-f(x3,varargin{:}))-(x2-x3)^2*(f(x2,varargin{:})-f(x1,varargin{:})))/((x2-x1)*(f(x2,varargin{:})-f(x3,varargin{:}))-(x2-x3)*(f(x2,varargin{:})-f(x1,varargin{:}))));
    if x4 < x2
      if f(x4,varargin{:}) < f(x2,varargin{:})
        xopt = x4; %xone
        xu = x2; %xL
        xcho = x4;
      else
        xopt = x4;
        xl = x4; %xone
        xcho = x2;
      end
    else
      if f(x4,varargin{:}) < f(x2,varargin{:})
        xopt = x4; %xone
        xl = x2; %xL
        xcho = x4;
      else
        xopt = x4;
        xu = x4; %xone
        xcho = x2;
      end
    end
    iter = iter + 1;
    if xopt~=0, ea = (2-phi)*abs((xu-xl)/xopt)*100;end
    if ea <= es | iter >= maxit,break,end
  end
  x = xopt; fx=f(xopt,varargin{:});
end