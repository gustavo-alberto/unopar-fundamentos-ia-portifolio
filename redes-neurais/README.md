# Rede Neural Simples em Python

Este projeto implementa uma rede neural simples (perceptron de camada única) com função de ativação sigmoide, utilizando NumPy e matplotlib para visualização do erro durante o treinamento.

O ambiente é encapsulado em um container Docker para garantir reprodutibilidade e facilidade de execução.

## Como executar
1. Build da imagem
```bash
docker-compose build
```

2. Rodar o container
```bash
docker-compose up
```

O script será executado dentro do container, exibindo os logs do treinamento no terminal.
