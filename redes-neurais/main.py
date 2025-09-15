from typing import List, Tuple

import matplotlib.pyplot as plt
import numpy as np


def sigmoid(x: np.ndarray) -> np.ndarray:
    """
    Função sigmoide.
    Transforma valores em uma curva suave entre 0 e 1.
    """
    return 1 / (1 + np.exp(-x))


def sigmoid_derivative(x: np.ndarray) -> np.ndarray:
    """
    Derivada da função sigmoide.
    Utilizada para calcular o gradiente no ajuste dos pesos.
    """
    return x * (1 - x)


def initialize_weights(num_inputs: int, seed: int = 1) -> np.ndarray:
    """
    Inicializa os pesos da rede neural de forma aleatória.
    """
    np.random.seed(seed)
    return 2 * np.random.random((num_inputs, 1)) - 1


def train_network(
    inputs: np.ndarray, targets: np.ndarray, num_iterations: int, learning_rate: float
) -> Tuple[np.ndarray, List[float]]:
    """
    Treina a rede neural simples usando retropropagação.

    Args:
        inputs (np.ndarray): matriz de entradas (amostras x características).
        targets (np.ndarray): matriz de saídas desejadas.
        num_iterations (int): número de iterações de treinamento.
        learning_rate (float): taxa de aprendizado.

    Returns:
        Tuple[np.ndarray, List[float]]: pesos ajustados e lista de erros por iteração.
    """
    num_samples, num_inputs = inputs.shape
    synaptic_weights: np.ndarray = initialize_weights(num_inputs)
    errors: List[float] = []

    for iteration in range(num_iterations):
        # Propagação para frente (forward propagation)
        layer_output: np.ndarray = sigmoid(np.dot(inputs, synaptic_weights))

        # Cálculo do erro
        error: np.ndarray = targets - layer_output

        # Cálculo do erro quadrático médio (MSE)
        mean_squared_error: float = np.mean(error**2)
        errors.append(mean_squared_error)

        # Impressão periódica do erro
        if iteration % 1000 == 0:
            print(f"Iteração {iteration} - Erro quadrático médio: {mean_squared_error:.6f}")

        # Cálculo dos ajustes usando a derivada da sigmoide
        adjustments: np.ndarray = error * sigmoid_derivative(layer_output)

        # Atualização dos pesos
        synaptic_weights += learning_rate * np.dot(inputs.T, adjustments)

    return synaptic_weights, errors


def evaluate_network(inputs: np.ndarray, synaptic_weights: np.ndarray) -> np.ndarray:
    """
    Avalia a rede neural após o treinamento.
    """
    return sigmoid(np.dot(inputs, synaptic_weights))


def main() -> None:
    """
    Função principal para execução do treinamento e avaliação.
    """
    # Entradas (XOR simplificado com bias na última coluna)
    inputs: np.ndarray = np.array(
        [
            [0, 0, 1],
            [1, 1, 1],
            [1, 0, 1],
            [0, 1, 1],
        ]
    )

    # Saídas desejadas
    targets: np.ndarray = np.array(
        [
            [0],
            [1],
            [1],
            [0],
        ]
    )

    num_iterations: int = 10_000
    learning_rate: float = 0.1

    # Treinamento da rede
    synaptic_weights, errors = train_network(inputs, targets, num_iterations, learning_rate)

    # Avaliação da rede
    final_output: np.ndarray = evaluate_network(inputs, synaptic_weights)

    # Resultados
    print("\nPesos finais da sinapse após o treinamento:")
    print(synaptic_weights)

    print("\nSaídas da rede após o treinamento:")
    print(final_output)

    # Gráfico da evolução do erro
    plt.plot(errors)
    plt.xlabel("Número de Iterações")
    plt.ylabel("Erro quadrático médio")
    plt.title("Evolução do erro durante o treinamento")
    plt.savefig("Treinamento.png")
    plt.close()


if __name__ == "__main__":
    main()
