# Definir uma estrutura de Fila
struct Fila
    elementos::Vector{Int64}  # Vetor para armazenar os elementos da fila
    inicio::Int64             # Índice do primeiro elemento da fila
    fim::Int64                # Índice do próximo elemento livre para inserção
    capacidade::Int64         # Capacidade máxima da fila
end

# Construtor para criar uma fila vazia com uma capacidade inicial
function Fila(capacidade_inicial::Int64)
    return Fila(Vector{Int64}(undef, capacidade_inicial), 1, 1, capacidade_inicial)
end

# Função para enfileirar (adicionar) um elemento à fila
function enfileirar!(fila::Fila, elemento::Int64)
    if (fila.fim - fila.inicio + 1) > fila.capacidade
        throw(ErrorException("Fila cheia! Não é possível enfileirar mais elementos."))
    end
    fila.elementos[fila.fim] = elemento
    fila.fim += 1
end

# Função para desenfileirar (remover) um elemento da fila
function desenfileirar!(fila::Fila)
    if fila.fim == fila.inicio
        throw(ErrorException("Fila vazia! Não é possível desenfileirar."))
    end
    elemento = fila.elementos[fila.inicio]
    fila.inicio += 1
    return elemento
end

# Função para verificar se a fila está vazia
function estaVazia(fila::Fila)
    return fila.inicio == fila.fim
end

# Função para verificar o primeiro elemento da fila
function primeiro(fila::Fila)
    if estaVazia(fila)
        throw(ErrorException("Fila vazia! Não há elementos para retornar."))
    end
    return fila.elementos[fila.inicio]
end

# Função para retornar o tamanho atual da fila
function tamanho(fila::Fila)
    return fila.fim - fila.inicio
end

# Exemplo de uso
fila = Fila(5)

# Enfileirar elementos
enfileirar!(fila, 10)
enfileirar!(fila, 20)
enfileirar!(fila, 30)

# Exibir o primeiro elemento da fila
println("Primeiro elemento da fila: ", primeiro(fila))  # 10

# Desenfileirar um elemento
println("Elemento desenfileirado: ", desenfileirar!(fila))  # 10

# Exibir o novo primeiro elemento da fila
println("Novo primeiro elemento: ", primeiro(fila))  # 20

# Verificar se a fila está vazia
println("A fila está vazia? ", estaVazia(fila))  # false

# Exibir o tamanho da fila
println("Tamanho da fila: ", tamanho(fila))  # 2
