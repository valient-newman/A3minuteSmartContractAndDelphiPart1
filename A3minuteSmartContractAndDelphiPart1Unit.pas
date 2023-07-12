{******************************************************************************}
{                                                                              }
{                                  Delphereum                                  }
{                                                                              }
{             Copyright(c) 2018 Stefan van As <svanas@runbox.com>              }
{           Github Repository <https://github.com/svanas/delphereum>           }
{                                                                              }
{             Distributed under GNU AGPL v3.0 with Commons Clause              }
{                                                                              }
{   This program is free software: you can redistribute it and/or modify       }
{   it under the terms of the GNU Affero General Public License as published   }
{   by the Free Software Foundation, either version 3 of the License, or       }
{   (at your option) any later version.                                        }
{                                                                              }
{   This program is distributed in the hope that it will be useful,            }
{   but WITHOUT ANY WARRANTY; without even the implied warranty of             }
{   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              }
{   GNU Affero General Public License for more details.                        }
{                                                                              }
{   You should have received a copy of the GNU Affero General Public License   }
{   along with this program.  If not, see <https://www.gnu.org/licenses/>      }
{                                                                              }
{******************************************************************************}
// Delphereum Study. Tutorial 'A 3-minute Smart Contract and Delphi — Part 1'
// Project in Embarcadero Delphi 11 made with source of this tutorial: https://svanas.medium.com/a-3-minute-smart-contract-and-delphi-61d998571d
// Prepared by Valient Newman <valient.newman@proton.me>
// My Github Repository <https://github.com/valient-newman>

unit A3minuteSmartContractAndDelphiPart1Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Web3, Web3.eth, Web3.eth.types;

procedure TForm1.Button1Click(Sender: TObject);
var
  Ropsten : TChain;
begin
web3.eth.call(TWeb3.Create(
    Ropsten.SetRPC(                                   // Ropsten test net
    'https://ropsten.infura.io/v3/your-project-id')), // RPC access to Ethereum
    '0x0a25cad45f87973177d524f3152860a17dfbe30c',     // smart contract address
    'myFirstHelloWorld()', [], procedure(tup: TTuple; err: IError)
  begin
    TThread.Synchronize(nil, procedure
    begin
      if Assigned(err) then
        MessageDlg(err.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0)
      else
        ShowMessage(tup.ToString);
    end);
  end);
end;

end.
