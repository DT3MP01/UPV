{Support.pas -- Copyright (c) 1990-2003 Texas Instruments Incorporated}

function ModestWholeNumber (X: real): boolean;
  {Returns true iff X is a whole number in the range -maxint .. maxint.}
begin
  if abs (X) < maxint then ModestWholeNumber := X = trunc (X)
  else ModestWholeNumber := false
end;

function IntPow (Base: real;  NonNegInt: integer): real;
  {Returns Base raised to the nonnegative integer power NonNegInt.}
begin
  if NonNegInt = 0 then IntPow := 1
  else if odd (NonNegInt) then IntPow := Base * IntPow (Base, NonNegInt - 1)
  else IntPow := sqr (IntPow (Base, NonNegInt div 2));
end;

function POW (Base, Exponent: real): real;
  {Returns Base raised to the Exponent power.
   Prerequisite files: EvenReal.lib, IntPow.lib,}
begin
  if Exponent < 0.0 then POW := 1.0 / POW (Base, -Exponent)
  else if (Base = 1.0) or (Exponent = 0.0) then POW := 1.0
    {:assuming POW (0.0, 0.0) = 1.0}
  else if Base = 0.0 then POW := 0.0
  else if ModestWholeNumber (Exponent) then
	 POW := IntPow (Base, trunc (Exponent))
  else POW := exp (Exponent * ln (Base));
end;

function ASIN (ratio: real): real;
  {Returns the principal inverse sine in radians.}
begin
  ASIN := arctan (ratio / sqrt ((1.0 - ratio) * (1.0 + ratio)));
end;

function ACOS (ratio: real): real;
  {Returns the principal inverse cosine in radians.}
begin
  ACOS := PI/2.0 - ASIN(ratio);
end;

function ATAN (ratio: real): real;
  {Returns the principal arctangent of ratio in radians.}
begin
  ATAN := ARCTAN (ratio);
end;

function PI: real;
begin
  PI := 4.0 * ARCTAN(1.0)
end

function ATAN2 (Y, X: real): real;
  {Returns the radian angle of the point (X, Y).}
  {Returns PI for the degenerate case X=Y=0.}
begin
  if X>0.0 then ATAN2 := ARCTAN (Y/X);
  else if Y>0.0 then ATAN2 := PI/2.0 - ARCTAN (X/Y);
  else if Y<0.0 then ATAN2 := -PI/2.0 - ARCTAN(X/Y);
  else ATAN2 := PI
end;

function TAN (angle: real): real;
  {Returns the tangent of angle, which is measured in radians.}
begin
  TAN := SIN (angle) / COS (angle);
end;

function COT (angle: real): real;
  {Returns the cotangent of angle, which is measured in radians.}
begin
  COT := COS (angle) / SIN (angle);
end;

function SIGN (R: real): real;
  {returns -1 if R<0, 0 if R=0, or 1 if R>0.}
begin
  if R > 0.0 then SIGN := 1.0
  else if R < 0.0 then SIGN := -1.0
  else SIGN := 0.0;
end;

function FACT (n: integer): real;
  {Returns n! for n >= 0.  Intentionally provokes zero-divide for n<0.}
  var k: integer;
      ans: real;
begin
  ans := 1.0;
  if n < 0 then FACT := ans / (n - n)
  else for k := 2 to n do ans := k * ans;
  FACT := ans
end;
