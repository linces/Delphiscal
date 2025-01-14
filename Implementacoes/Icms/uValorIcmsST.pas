unit uValorIcmsST;

interface
uses
  uBaseIcmsST, uValorIcms;

type
  TValorIcmsST = class
    private
      FBaseIcmsST: TBaseIcmsST;
      FAliquotaST: currency;
      FValorIcmsProprio: TValorIcms;

    public
      constructor Create(_baseIcmsST: TBaseIcmsST;
                         _aliquotaST: currency;
                         _valorIcmsProrpio: TValorIcms);

      function CalcularValorIcmsST: currency;
      function CalcularValorReduzidoIcmsST: currency;
      function CalcularValorNormalIcmsST: currency;

  end;

implementation

uses
 acbrutil.Math;

{ TValorIcmsST }

constructor TValorIcmsST.Create(_baseIcmsST: TBaseIcmsST;
                                _aliquotaST: currency;
                                _valorIcmsProrpio: TValorIcms);
begin
 FBaseIcmsST := _baseIcmsST;
 FAliquotaST := _aliquotaST;
 FValorIcmsProprio := _valorIcmsProrpio;
end;

function TValorIcmsST.CalcularValorIcmsST: currency;
begin
if (FBaseIcmsST.ContemReducaoST) then
    result := CalcularValorReduzidoIcmsST
else
   result := CalcularValorNormalIcmsST;

end;

function TValorIcmsST.CalcularValorNormalIcmsST: currency;
begin
     Result := RoundABNT((FBaseIcmsST.CalcularBaseNormalST * (FAliquotaST/100) -
            FValorIcmsProprio.GetValorIcms),2);
end;

function TValorIcmsST.CalcularValorReduzidoIcmsST: currency;
begin
  Result := RoundABNT((FBaseIcmsST.CalcularBaseReduzidaST * (FAliquotaST/100) -
            FValorIcmsProprio.GetValorIcms),2);
end;



end.
