function test_fuzzy()
  % =================================================================
  % SCRIPT DE TESTE PARA fuzzy.m
  % =================================================================
  % Executa alguns casos de teste chamando a função fuzzy
  % =================================================================

  clear; clc;

  fprintf('Iniciando testes para a funcao fuzzy...\n');
  fprintf('=============================================================\n\n');

  % Lista de casos [comida servico]
  casos = [
      9   8;   % esperado: perto de 15
      9   7;   % esperado: perto de 15
      7   8.5; % esperado: perto de 15
      3   6;   % esperado: perto de 5-10
      7   4;   % esperado: perto de 5-10
      2   3;   % esperado: perto de 5
      7   7;   % esperado: ~10
  ];

  for i = 1:size(casos, 1)
    comida = casos(i, 1);
    servico = casos(i, 2);
    gorjeta = fuzzy(comida, servico);
    fprintf('Teste %d: Comida=%.1f, Servico=%.1f -> Gorjeta sugerida: %.2f%%\n', ...
            i, comida, servico, gorjeta);
  end

  fprintf('\n=============================================================\n');
  fprintf('Testes concluidos.\n');
end
