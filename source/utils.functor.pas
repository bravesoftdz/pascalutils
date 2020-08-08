(******************************************************************************)
(*                                PascalUtils                                 *)
(*              object pascal library of utils data structures                *)
(*                                                                            *)
(* Copyright (c) 2020                                       Ivan Semenkov     *)
(* https://github.com/isemenkov/pascalutils                 ivan@semenkov.pro *)
(*                                                          Ukraine           *)
(******************************************************************************)
(*                                                                            *)
(* This source  is free software;  you can redistribute  it and/or modify  it *)
(* under the terms of the GNU General Public License as published by the Free *)
(* Software Foundation; either version 3 of the License.                      *)
(*                                                                            *)
(* This code is distributed in the  hope that it will  be useful, but WITHOUT *)
(* ANY  WARRANTY;  without even  the implied  warranty of MERCHANTABILITY  or *)
(* FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License for *)
(* more details.                                                              *)
(*                                                                            *)
(* A copy  of the  GNU General Public License is available  on the World Wide *)
(* Web at <http://www.gnu.org/copyleft/gpl.html>. You  can also obtain  it by *)
(* writing to the Free Software Foundation, Inc., 51  Franklin Street - Fifth *)
(* Floor, Boston, MA 02110-1335, USA.                                         *)
(*                                                                            *)
(******************************************************************************)

unit utils.functor;

{$mode objfpc}{$H+}
{$IFOPT D+}
  {$DEFINE DEBUG}
{$ENDIF}

interface

uses    
  SysUtils;

type
  { Base unary functor }  
  generic TUnaryFunctor<V, R> = class
  public
    function Call(AValue : V) : R; virtual; abstract;
  end;

  { Base binary functor }
  generic TBinaryFunctor<V, R> = class
  public  
    function Call(AValue1, AValue2 : V) : R; virtual; abstract;
  end;

  { Unary functor returns Boolean value }
  generic TUnaryLogicFunctor<V> = class
  public
    function Call(AValue : V) : Boolean; virtual; abstract;
  end;  

  { Binary functor returns Boolean value }
  generic TBinaryLogicFunctor<V> = class
  public
    function Call(AValue1, AValue2 : V) : Boolean; virtual; abstract;
  end;  

  { -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                      Binary less functors for default types
    
    If AValue1 < AValue2 return 1, if AValue2 < AValue1 return -1, 
    overwise return 0                  
    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= }
  generic TDefaultBinaryLessFunctor<V> = 
    class(specialize TBinaryFunctor<V, Integer>)
  public
    function Call(AValue1, AValue2 : V) : Integer; override;
  end;

  TBinaryLessFunctorByte = 
    class(specialize TDefaultBinaryLessFunctor<Byte>);
  TBinaryLessFunctorShortInt = 
    class(specialize TDefaultBinaryLessFunctor<ShortInt>);
  TBinaryLogicLessFunctorWord = 
    class(specialize TDefaultBinaryLessFunctor<Word>);
  TBinaryLessFunctorSmallInt = 
    class(specialize TDefaultBinaryLessFunctor<SmallInt>);
  TBinaryLessFunctorInteger = 
    class(specialize TDefaultBinaryLessFunctor<Integer>);
  TBinaryLessFunctorDWord = 
    class(specialize TDefaultBinaryLessFunctor<DWord>);
  TBinaryLessFunctorCardinal = 
    class(specialize TDefaultBinaryLessFunctor<Cardinal>);
  TBinaryLessFunctorLongWord = 
    class(specialize TDefaultBinaryLessFunctor<LongWord>);
  TBinaryLessFunctorLongInt = 
    class(specialize TDefaultBinaryLessFunctor<LongInt>);
  TBinaryLessFunctorQWord = 
    class(specialize TDefaultBinaryLessFunctor<QWord>);
  TBinaryLessFunctorInt64 = 
    class(specialize TDefaultBinaryLessFunctor<Int64>);
  TBinaryLessFunctorSingle = 
    class(specialize TDefaultBinaryLessFunctor<Single>);
  TBinaryLessFunctorReal = 
    class(specialize TDefaultBinaryLessFunctor<Real>);
  TBinaryLessFunctorDouble = 
    class(specialize TDefaultBinaryLessFunctor<Double>);
  TBinaryLessFunctorExtended = 
    class(specialize TDefaultBinaryLessFunctor<Extended>);
  TBinaryLessFunctorCurrency = 
    class(specialize TDefaultBinaryLessFunctor<Currency>);
  TBinaryLessFunctorBoolean = 
    class(specialize TDefaultBinaryLessFunctor<Boolean>);
  TBinaryLessFunctorChar = 
    class(specialize TDefaultBinaryLessFunctor<Char>);
  TBinaryLessFunctorWideChar = 
    class(specialize TDefaultBinaryLessFunctor<WideChar>);  
  TBinaryLessFunctorString = 
    class(specialize TDefaultBinaryLessFunctor<String>);
  TBinaryLessFunctorWideString = 
    class(specialize TDefaultBinaryLessFunctor<WideString>);


  { -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
                   Binary less logic functors for default types
                        
    Return True if AValue1 < AValue2                       
    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= } 
  generic TDefaultBinaryLogicLessFunctor<V> = 
    class (specialize TBinaryLogicFunctor<V>)
  public
    function Call(AValue1, AValue2 : V) : Boolean; override;
  end;

  TBinaryLogicLessFunctorByte = 
    class(specialize TDefaultBinaryLogicLessFunctor<Byte>);
  TBinaryLogicLessFunctorShortInt = 
    class(specialize TDefaultBinaryLogicLessFunctor<ShortInt>);
  TBinaryLogicLessFunctorWord = 
    class(specialize TDefaultBinaryLogicLessFunctor<Word>);
  TBinaryLogicLessFunctorSmallInt = 
    class(specialize TDefaultBinaryLogicLessFunctor<SmallInt>);
  TBinaryLogicLessFunctorInteger = 
    class(specialize TDefaultBinaryLogicLessFunctor<Integer>);
  TBinaryLogicLessFunctorDWord = 
    class(specialize TDefaultBinaryLogicLessFunctor<DWord>);
  TBinaryLogicLessFunctorCardinal = 
    class(specialize TDefaultBinaryLogicLessFunctor<Cardinal>);
  TBinaryLogicLessFunctorLongWord = 
    class(specialize TDefaultBinaryLogicLessFunctor<LongWord>);
  TBinaryLogicLessFunctorLongInt = 
    class(specialize TDefaultBinaryLogicLessFunctor<LongInt>);
  TBinaryLogicLessFunctorQWord = 
    class(specialize TDefaultBinaryLogicLessFunctor<QWord>);
  TBinaryLogicLessFunctorInt64 = 
    class(specialize TDefaultBinaryLogicLessFunctor<Int64>);
  TBinaryLogicLessFunctorSingle = 
    class(specialize TDefaultBinaryLogicLessFunctor<Single>);
  TBinaryLogicLessFunctorReal = 
    class(specialize TDefaultBinaryLogicLessFunctor<Real>);
  TBinaryLogicLessFunctorDouble = 
    class(specialize TDefaultBinaryLogicLessFunctor<Double>);
  TBinaryLogicLessFunctorExtended = 
    class(specialize TDefaultBinaryLogicLessFunctor<Extended>);
  TBinaryLogicLessFunctorCurrency = 
    class(specialize TDefaultBinaryLogicLessFunctor<Currency>);
  TBinaryLogicLessFunctorBoolean = 
    class(specialize TDefaultBinaryLogicLessFunctor<Boolean>);
  TBinaryLogicLessFunctorChar = 
    class(specialize TDefaultBinaryLogicLessFunctor<Char>);
  TBinaryLogicLessFunctorWideChar = 
    class(specialize TDefaultBinaryLogicLessFunctor<WideChar>);  
  TBinaryLogicLessFunctorString = 
    class(specialize TDefaultBinaryLogicLessFunctor<String>);
  TBinaryLogicLessFunctorWideString = 
    class(specialize TDefaultBinaryLogicLessFunctor<WideString>);

implementation

function TDefaultBinaryLessFunctor.Call(AValue1, AValue2 : V) : Integer;
begin
  if AValue1 < AValue2 then
  begin
    Result := 1;
  end else if AValue2 < AValue1 then
  begin
    Result := -1
  end else
  begin
    Result := 0;
  end;
end;

function TDefaultBinaryLogicLessFunctor.Call(AValue1, AValue2 : V) : Boolean;
begin
  Result := AValue1 < AValue2;
end;


end.
