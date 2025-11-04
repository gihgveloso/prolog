resolve(S) :-
    S = candidatos(_,_,_,_,_),
    
    % O candidato que gosta de Basquete está em algum lugar entre quem tem 22 anos e quem gosta de Corrida, nessa ordem.
	esporte(A,basquete),
    algum_lugar_entre(A,B,C,S),
    idade(B,22),
    esporte(C,corrida),
    % Na quarta posição está quem gosta de Basquete.
    quarta_posicao(A,S),
    % O candidato que gosta de Futebol está na segunda posição.
    segunda_posicao(D,S),
    esporte(D,futebol),
    % Michel está exatamente à esquerda de quem gosta de Boliche.
    exatamente_esquerda(E,F,S),
    nome(E,michel),
    esporte(F,boliche),
    % Quem gosta de Uva gosta de Corrida.
	fruta(C,uva),
    % Michel está exatamente à esquerda do candidato que gosta de Maçã.
	fruta(F,maca),
    % Os candidatos que gostam de Morango e Abacaxi estão lado a lado.
	fruta(G,morango),
    fruta(H,abacaxi),
    ao_lado(G,H,S),
    % O candidato de Branco está ao lado do candidato que gosta de Morango.
	camisa(I,branca),
    ao_lado(I,G,S),
	% Quem está de camisa Amarela está ao lado do candidato mais velho.
    camisa(J,amarela),
    idade(K,35),
    ao_lado(J,K,S),
	% O candidato de Vermelho está em algum lugar à esquerda do candidato de 24 anos.
    camisa(L,vermelha),
    idade(M,24),
    algum_lugar_esquerda(L,M,S),
    % Na segunda posição está o candidato de 32 anos.
    idade(D,32),
    % Quem tem 22 anos está exatamente à esquerda de Michel.
    exatamente_esquerda(B,E,S),
    % O cantor está exatamente à direita de Júnior.
    talento(N,canto),
    exatamente_direita(N,O,S),
    nome(O,junior),
    % O malabarista está exatamente à esquerda do cantor.
    talento(P,malabarismo),
	exatamente_esquerda(P,N,S),
	% Quem gosta de Futebol está exatamente à direita de quem faz Imitação.
    talento(Q,imitacao),
    exatamente_direita(D,Q,S),
    % O cantor está em uma das pontas
    em_ponta(N,S),
    % Rodolfo está em algum lugar à direita do candidato de Vermelho.
    nome(R,rodolfo),
    algum_lugar_direita(R,L,S),
    % Alexander está exatamente à esquerda do candidato de 32 anos.
    nome(T,alexander),
    exatamente_esquerda(T,D,S),
    % Júnior está com a camisa Verde.
    camisa(O,verde),
    % O candidato que gosta de Abacaxi está exatamente à direita de quem gosta de Natação.
    esporte(U,natacao),
    exatamente_direita(H,U,S),
    % O Músico está de Vermelho.
    talento(L,musica),
    
    % Restrições restantes.
    algum_candidato(V,S),
    nome(V,heitor),
    algum_candidato(Y,S),
    idade(Y,29),
    algum_candidato(W,S),
    camisa(W,azul),    
    algum_candidato(X,S),
    talento(X,danca),
    algum_candidato(Z,S),
    fruta(Z,banana).

camisa(candidato(C,_,_,_,_,_),C).
nome(candidato(_,N,_,_,_,_),N).
talento(candidato(_,_,T,_,_,_),T).
idade(candidato(_,_,_,I,_,_),I).
fruta(candidato(_,_,_,_,F,_),F).
esporte(candidato(_,_,_,_,_,E),E).
    
    
algum_lugar_entre(X,Y,Z,candidatos(Y,X,_,_,Z)).
algum_lugar_entre(X,Y,Z,candidatos(Y,_,X,_,Z)).
algum_lugar_entre(X,Y,Z,candidatos(Y,_,_,X,Z)).
algum_lugar_entre(X,Y,Z,candidatos(_,Y,X,_,Z)).
algum_lugar_entre(X,Y,Z,candidatos(_,Y,_,X,Z)).
algum_lugar_entre(X,Y,Z,candidatos(_,_,Y,X,Z)).

quarta_posicao(X,candidatos(_,_,_,X,_)).
segunda_posicao(X,candidatos(_,X,_,_,_)).

exatamente_direita(X,Y,candidatos(Y,X,_,_,_)).
exatamente_direita(X,Y,candidatos(_,Y,X,_,_)).
exatamente_direita(X,Y,candidatos(_,_,Y,X,_)).
exatamente_direita(X,Y,candidatos(_,_,_,Y,X)).

exatamente_esquerda(X,Y,S) :- 
    exatamente_direita(Y,X,S).

ao_lado(X,Y,S):-
    exatamente_direita(X,Y,S);
    exatamente_direita(Y,X,S).

algum_lugar_esquerda(X,Y,candidatos(X,Y,_,_,_)).
algum_lugar_esquerda(X,Y,candidatos(X,_,Y,_,_)).
algum_lugar_esquerda(X,Y,candidatos(X,_,_,Y,_)).
algum_lugar_esquerda(X,Y,candidatos(X,_,_,_,Y)).
algum_lugar_esquerda(X,Y,candidatos(_,X,Y,_,_)).
algum_lugar_esquerda(X,Y,candidatos(_,X,_,Y,_)).
algum_lugar_esquerda(X,Y,candidatos(_,X,_,_,Y)).
algum_lugar_esquerda(X,Y,candidatos(_,_,X,Y,_)).
algum_lugar_esquerda(X,Y,candidatos(_,_,X,_,Y)).
algum_lugar_esquerda(X,Y,candidatos(_,_,_,X,Y)).

algum_lugar_direita(X,Y,S) :- 
    algum_lugar_esquerda(Y,X,S).

em_ponta(X,candidatos(X,_,_,_,_)).
em_ponta(X,candidatos(_,_,_,_,X)).

algum_candidato(X,candidatos(X,_,_,_,_)).
algum_candidato(X,candidatos(_,X,_,_,_)).
algum_candidato(X,candidatos(_,_,X,_,_)).
algum_candidato(X,candidatos(_,_,_,X,_)).
algum_candidato(X,candidatos(_,_,_,_,X)).

