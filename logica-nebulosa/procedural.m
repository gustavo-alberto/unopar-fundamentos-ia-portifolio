function gorjeta = procedural(comida, servico)
  % Calcula a gorjeta de forma procedural usando regras fixas
  %
  % Argumentos:
  %   comida  - Nota para a qualidade da comida (escala de 0 a 10)
  %   servico - Nota para a qualidade do servico (escala de 0 a 10)
  %
  % Retorna:
  %   gorjeta - Percentual de gorjeta a ser pago (5, 10 ou 15)
  %
  % Observacao:
  %   A logica abaixo segue regras fixas de decisao. Ela nao aprende e nem
  %   se adapta a novas situacoes. E apenas uma implementacao baseada em if.

  % --- Validacao das entradas ---
  % Antes de aplicar qualquer regra, precisamos garantir que os valores
  % estao dentro da faixa permitida (0 ate 10).
  if (comida < 0 || comida > 10 || servico < 0 || servico > 10)
    error("As notas de comida e servico devem estar entre 0 e 10")
  end

  % --- Bloco de decisao logica ---
  % A ordem dos testes influencia o resultado final
  % Primeiro verificamos a condicao mais forte (surpreendente)
  % Depois a condicao mais fraca (ruim)
  % E por ultimo aplicamos o caso padrao

  % Regra 1: Se a comida ou o servico foram surpreendentes
  % Surpreendente significa nota maior ou igual a 8
  % Nesse caso deixamos uma gorjeta alta de 15
  if (comida >= 8 || servico >= 8)
    gorjeta = 15;

  % Regra 2: Se a comida ou o servico foram ruins
  % Ruim significa nota menor ou igual a 4
  % Nesse caso deixamos uma gorjeta baixa de 5
  elseif (comida <= 4 || servico <= 4)
    gorjeta = 5;

  % Regra 3: Caso padrao
  % Isso cobre as situacoes intermediarias (5, 6 ou 7)
  % Nesse caso deixamos uma gorjeta mediana de 10
  else
    gorjeta = 10;
  end

end
