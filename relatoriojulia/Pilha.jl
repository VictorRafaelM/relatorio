#definir uma estrutura de pilha
struct Pilha
    elementos::Vector{Int64}  # Vetor para armazenar os elementos da pilha
    topo::Int64               # Indica a posição do topo da pilha
end

# Construtor para criar uma pilha vazia com uma capacidade inicial
function Pilha(capacidade_inicial::Int64)
    return Pilha(Vector{Int64}(undef, capacidade_inicial), 0)
end

# Função para empilhar (push) um elemento
function empilhar!(pilha::Pilha, elemento::Int64)
    if pilha.topo == length(pilha.elementos)
        redimensionar!(pilha)
    end
    pilha.topo += 1
    pilha.elementos[pilha.topo] = elemento
end

# Função para desempilhar (pop) um elemento
function desempilhar!(pilha::Pilha)
    if pilha.topo == 0
        throw(ErrorException("Pilha vazia! Não é possível desempilhar."))
    end
    elemento = pilha.elementos[pilha.topo]
    pilha.topo -= 1
    return elemento
end

# Função para visualizar o elemento no topo da pilha
function topo(pilha::Pilha)
    if pilha.topo == 0
        throw(ErrorException("Pilha vazia! Não há elementos no topo."))
    end
    return pilha.elementos[pilha.topo]
end

# Função para verificar se a pilha está vazia
function estaVazia(pilha::Pilha)
    return pilha.topo == 0
end

# Função para redimensionar a pilha quando necessário
function redimensionar!(pilha::Pilha)
    novo_array = Vector{Int64}(undef, length(pilha.elementos) * 2)
    for i in 1:pilha.topo
        novo_array[i] = pilha.elementos[i]
    end
    pilha.elementos = novo_array
end

# Função para obter o tamanho da pilha
function tamanho(pilha::Pilha)
    return pilha.topo
end

# Exemplo de uso
pilha = Pilha(5)

# Empilhar elementos
empilhar!(pilha, 10)
empilhar!(pilha, 20)
empilhar!(pilha, 30)

# Exibir o elemento do topo
println("Elemento no topo da pilha: ", topo(pilha))  # 30

# Desempilhar um elemento
println("Elemento desempilhado: ", desempilhar!(pilha))  # 30

# Exibir o novo topo da pilha
println("Novo elemento no topo: ", topo(pilha))  # 20

# Verificar se a pilha está vazia
println("A pilha está vazia? ", estaVazia(pilha))  # false

# Exibir o tamanho da pilha
println("Tamanho da pilha: ", tamanho(pilha))  # 2
