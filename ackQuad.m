function ackQuad(p) 
% função maior em que serão recebidos os parâmetros p de tamanhos mínimos e
% máximos do side arm "b"e do conection arm "c"
bMin=p(1);
bMax=p(3);

cMin=p(2);
cMax=p(4);

n=20; % número de passos
table=zeros(n, 5);


% Criação da tabela de diferentes quadriláteros e suas respostas aos
% métodos 
    intB=abs(bMax-bMin)/n;
    intC=abs(cMax-cMin)/n;

    for cont=1:n+1
        iterationB=bMin+intB*(cont-1); 
        iterationC=cMin+intC*(cont-1); 

        f=direcCuad([iterationB, iterationC]);

        table(cont, 1)=iterationB; % Tamanho do side arm 
        table(cont, 2)= iterationC; % Tamanho do conection arm 
        table(cont, 3)= f(1); % Diferença entre ângulo máximo de sterçamento necessário de acordo com o raio mínimo e o ângulo máximo fornecido pelo mecanismo
        table(cont, 4)= f(2); % Raiz da soma dos quadrados das diferenças entre o ângulo de esterçamento  de acordo com a relação e o ângulo externo provido pelo mecanismo
        table(cont, 5)= f(3); % ângulo do side arm
        
    end
assignin("base", "table", table)

end 