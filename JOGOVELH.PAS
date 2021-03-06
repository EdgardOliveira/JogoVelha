Program JogoDaVelha;

Uses Crt;

Var
vGrade : Array [1..9] of String;
indice, contaJogadas, ganhador : Integer;

procedure creditos;
begin
  ClrScr;
  
  TextBackground(Blue);
  WriteLn('+------------------------------------------------------+');
  WriteLn('�                        FAMETRO                       �');
  WriteLn('+------------------------------------------------------+');
  TextBackground(White);
  TextColor(Black);
  WriteLn('�                                                      �');
  WriteLn('�             CURSO: SISTEMAS DE INFORMA��O            �');
  WriteLn('�                                                      �');
  WriteLn('�  FUNDAMENTOS, PARADIGMAS E LINGUAGEM DE PROGRAMA��O  �');
  WriteLn('�                                                      �');
  WriteLn('�                 PROFESSORA: ALINE                    �');
  WriteLn('�                                                      �');
  WriteLn('�    TRABALHO: JOGO DA VELHA DESENVOLVIDO EM PASCAL    �');
  WriteLn('�                                                      �');
  WriteLn('�                                                      �');
  TextBackground(Red);
  TextColor(White);
  WriteLn('+------------------------------------------------------+');
  WriteLn('�            DESENVOLVEDOR: EDGARD OLIVEIRA            �');
  WriteLn('+------------------------------------------------------+');
  TextBackGround(Blue);
  WriteLn;
  WriteLn;
  WriteLn;
  WriteLn('Pressione uma tecla para iniciar o jogo para 2 pessoas...');
  
  ReadKey;
end;

procedure inicializarJogo;
begin
  for indice:=1 to 9 do begin
    {converte inteiro para uma string}
    Str(indice, vGrade[indice]);
  end;
end;

procedure analisarJogadas(posicao1, posicao2, posicao3:integer);
begin
  {verificando se a posicao � igual a pr�xima posi��o}
  if (vGrade[posicao1]=vGrade[posicao2]) and (vGrade[posicao2]=vGrade[posicao3]) then
  if vGrade[posicao3]='X' then
  ganhador:=1
  else if vGrade[posicao3]='O' then
  ganhador:=2;
end;
procedure verificar;
begin
  {passando os �ndices da linha 1}
  analisarJogadas(1, 2, 3);
  {passando os �ndices da linha 2}
  analisarJogadas(4, 5, 6);
  {passando os �ndices da linha 3}
  analisarJogadas(7, 8, 9);
  {passando os �ndices da coluna 1}
  analisarJogadas(1, 4, 7);
  {passando os �ndices da coluna 2}
  analisarJogadas(2, 5, 8);
  {passando os �ndices da coluna 3}
  analisarJogadas(3, 6, 9);
  {passando os �ndices da diagonal 1}
  analisarJogadas(1, 5, 9);	{\}
  {passando os �ndices da diagonal 2}
  analisarJogadas(3, 5, 7);	{/}
  
  {montando o t�tulo da mensagem}
  if (ganhador<>0) or ((ganhador=0) and (contaJogadas>=9)) then begin
    TextBackground(Blue);
    WriteLn('+------------------------------------------------------+');
    WriteLn('�                       RESULTADO                      �');
    WriteLn('+------------------------------------------------------+');
  end;
  
  TextBackground(Red);
  {montando o resultado}
  if ganhador<>0 then begin
    WriteLn('� O JOGADOR, ', ganhador,' VENCEU A PARTIDA                        �');
    WriteLn('+------------------------------------------------------+');
    contaJogadas:=9; {for�ar o fim da partida}
  end else if ((ganhador=0) and (contaJogadas>=9)) then begin
    WriteLn('�             A PARTIDA EMPATOU/VELHOU                 �');
    WriteLn('+------------------------------------------------------+');
    contaJogadas:=9; {acaba a partida}
  end;
  TextBackGround(Black);
end;

procedure desenharGrade;
begin
  {limpando a tela}
  ClrScr;
  TextBackground(Green);
  {iniciando a montagem da grade}
  WriteLn('+--------------------+');
  WriteLn('�                    �');
  WriteLn('�      ',vGrade[1],' � ',vGrade[2],' � ',vGrade[3],'     �');
  WriteLn('�     ---�---�---    �');
  WriteLn('�      ',vGrade[4],' � ',vGrade[5],' � ',vGrade[6],'     �');
  WriteLn('�     ---�---�---    �');
  WriteLn('�      ',vGrade[7],' � ',vGrade[8],' � ',vGrade[9],'     �');
  WriteLn('�                    �');
  WriteLn('+--------------------+');
  TextBackground(Black);
  {chama a rotina de verifica��o de resultado}
  verificar;
End;

procedure jogar;
var jogador, carac, ec, indice2, posicao:integer;
linha:string;
vValidos: array [1..9] of integer;
validacao:boolean;
begin
	ganhador:=0;
	jogador:=0;
	contaJogadas:=0;
	
  {executa o programa enquanto o n�mero de jogadas for menor que 9}
  while contaJogadas<9 do begin
    carac:=0;
    {verificando de quem � a vez de jogar}
    if (contaJogadas mod 2 = 0) then
    	jogador:=1
    else
    	jogador:=2;
    
    case jogador of
      1:TextBackground(Blue);
      2:TextBackground(Red);
    end;
    
    WriteLn('+------------------------------------------------------+');
    WriteLn('�                       JOGADOR ',jogador,'                      �');
    WriteLn('+------------------------------------------------------+');
    TextBackground(Black);
    WriteLn('�      ESCOLHA UM DOS N�MEROS DISPON�VEIS ABAIXO:      �');
    WriteLn('+------------------------------------------------------+');
    Write('� ');
    
    {verificando as posi��es dispon�veis para jogar}
    for indice:=1 to 9 do begin
      {se n�o estiver preenchido com X ou O ent�o est� dispon�vel}
      if (vGrade[indice]<>'X') and (vGrade[indice]<>'O') then begin
        Write(vGrade[indice], ',');
        carac:=carac+2;
      	{convertendo string para inteiro}
      	val(vGrade[indice], vValidos[indice], ec );
    	end;
  	end;
  
	  linha:='                                                     �';
	  linha:=Copy(linha, carac+1, length(linha));
	  WriteLn(linha);
	  WriteLn('+------------------------------------------------------+');
	  WriteLn;
	  validacao:=false;
	  {verificando o que o usu�rio escolheu}
	  while validacao=false do begin
	    ReadLn(posicao);
	  	{percorrendo o vetor de n�meros v�lidos}
	  	for indice2:=1 to 9 do begin
	    	{verificando se o n�mero escolhido est�o v�lidos}
	    	if (vValidos[indice2]=posicao) then begin
	      	{passou no teste de valida��o}
	      	validacao:=true;
	      	{usa o n�mero e tira do vetor}
	      	vValidos[indice2]:=-1;
	    	end else if (validacao=false) and (indice2=9) then begin
	      	{se continua inv�lido e chegou ao final da verifica��o}
	      	{x=horizontal/coluna, y=vertica/linha}
	      	GotoXY(19,15);
	      	{o n�mero escolhido n�o � v�lido}
	      	{sinaliza para o usu�rio escolher um n�mero da lista}
	      	TextBackground(Red);
	      	Write('<-- Escolha um dos n�meros a esquerda');
	    	end;
	  	end;
  		TextBackground(Black);
  		GotoXY(1, 18);
		end;

		{incrementa uma jogada}
		contaJogadas:=contaJogadas+1;

		{marca o s�mbolo do jogador na posi��o escolhida}
		case jogador of
  		1:vGrade[posicao]:='X';
  		2:vGrade[posicao]:='O';
		end;
		{atualiza a grade com as jogadas}
		desenharGrade;
	end;
end;

Begin
  
  creditos;
  
  TextBackground(Black);
  
  inicializarJogo;
  
  desenharGrade;
  
  jogar;
  
  readkey;
  
End.