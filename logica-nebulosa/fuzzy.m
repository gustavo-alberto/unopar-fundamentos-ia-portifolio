function gorjeta = fuzzy(comida, servico)
  % =================================================================
  % FUNÇÃO fuzzy
  % =================================================================
  % Calcula a gorjeta usando lógica fuzzy.
  %
  % Argumentos:
  %   comida  - Nota da qualidade da comida (0 a 10)
  %   servico - Nota da qualidade do serviço (0 a 10)
  %
  % Retorna:
  %   gorjeta - Valor percentual de gorjeta sugerido (5 a 15)
  %
  % Observação:
  %   Usa o pacote "fuzzy-logic-toolkit". É necessário rodar:
  %   >> pkg load fuzzy-logic-toolkit
  %   antes de executar.
  % =================================================================

  % Carrega o toolkit
  pkg load fuzzy-logic-toolkit;

  % Cria o sistema de inferência fuzzy
  fis = newfis('calculadora_gorjeta');

  % ------------------------------
  % Variáveis de entrada
  % ------------------------------
  fis = addvar(fis, 'input', 'comida', [0 10]);
  fis = addvar(fis, 'input', 'servico', [0 10]);

  % Funções de pertinência para comida
  fis = addmf(fis, 'input', 1, 'Ruim',    'trapmf', [-1 0 3 5]);
  fis = addmf(fis, 'input', 1, 'Mediano', 'trapmf', [3 5 6 8]);
  fis = addmf(fis, 'input', 1, 'Bom',     'trapmf', [6 8 10 11]);

  % Funções de pertinência para serviço
  fis = addmf(fis, 'input', 2, 'Ruim',    'trapmf', [-2 0 3 5]);
  fis = addmf(fis, 'input', 2, 'Mediano', 'trapmf', [3 5 6 8]);
  fis = addmf(fis, 'input', 2, 'Bom',     'trapmf', [6 8 10 11]);

  % ------------------------------
  % Variável de saída (gorjeta)
  % ------------------------------
  fis = addvar(fis, 'output', 'gorjeta', [5 15]);

  % Funções de pertinência para gorjeta
  fis = addmf(fis, 'output', 1, 'Baixa', 'trapmf', [4 5 7 9]);
  fis = addmf(fis, 'output', 1, 'Media', 'trapmf', [7 9 11 13]);
  fis = addmf(fis, 'output', 1, 'Alta',  'trapmf', [11 13 15 16]);

  % ------------------------------
  % Regras fuzzy
  % ------------------------------
  % Cada linha: [comida servico gorjeta peso operador]
  ruleList = [
      1 1 1 1 1;  % comida ruim, serviço ruim -> gorjeta baixa
      2 2 2 1 1;  % ambos medianos -> gorjeta média
      3 3 3 1 1;  % ambos bons -> gorjeta alta
      1 2 2 1 1;  % comida ruim + serviço mediano -> média
      2 1 2 1 1;  % comida mediana + serviço ruim -> média
      1 3 2 1 1;  % comida ruim + serviço bom -> média
      3 1 2 1 1;  % comida boa + serviço ruim -> média
      2 3 3 1 1;  % comida mediana + serviço bom -> alta
      3 2 3 1 1;  % comida boa + serviço mediano -> alta
  ];

  fis = addrule(fis, ruleList);

  % ------------------------------
  % Avaliação do sistema fuzzy
  % ------------------------------
  entrada = [comida servico];
  gorjeta = evalfis(entrada, fis);

end
