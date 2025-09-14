function test_procedural()
  % =================================================================
  % SCRIPT DE TESTE PARA procedural.m
  % =================================================================
  % Este arquivo deve ser executado chamando no console:
  % >> test_procedural

  clear; clc;

  fprintf('Iniciando testes para a funcao procedural...\n');
  fprintf('=============================================================\n\n');

  % Categoria 1: Gorjeta Generosa (Esperado: 15)
  fprintf('--- Testes de Gorjeta Generosa (Esperado: 15) ---\n');
  entradas = [
      9, 7;
      7, 8.5;
      10, 2
  ];
  testar_casos(entradas, 15);

  % Categoria 2: Gorjeta Pequena (Esperado: 5)
  fprintf('\n--- Testes de Gorjeta Pequena (Esperado: 5) ---\n');
  entradas = [
      3, 6;
      7, 4;
      2, 3
  ];
  testar_casos(entradas, 5);

  % Categoria 3: Gorjeta Mediana (Esperado: 10)
  fprintf('\n--- Testes de Gorjeta Mediana (Esperado: 10) ---\n');
  entradas = [
      7, 7;
      5, 6;
      7.9, 7.9
  ];
  testar_casos(entradas, 10);

  fprintf('\n=============================================================\n');
  fprintf('Testes concluidos.\n');
end


% =================================================================
% FUNCAO AUXILIAR DE TESTE
% =================================================================
function testar_casos(entradas, esperado)
  for i = 1:size(entradas, 1)
    comida = entradas(i, 1);
    servico = entradas(i, 2);

    calculado = procedural(comida, servico);

    fprintf('Teste %d: Comida=%.1f, Servico=%.1f -> Esperado: %d, Calculado: %d ', ...
            i, comida, servico, esperado, calculado);

    if (calculado == esperado)
      fprintf('-> SUCESSO\n');
    else
      fprintf('-> FALHA\n');
    end
  end
end
