# Definir uma estrutura de Vetor
struct Vetor
    array::Vector{Int64} # O array que armazena os elementos
    tamanho::Int64       # Tamanho atual do vetor
end

#Construtor para criar um vetor vazio com capacidade inicial
function vetor(capacidade_inicial::Int64)
    return Vetor(Vector{Int64}(undef, capacidade_inicial), 0)
end

#função para adicionar um elemento ao final do vetor
function adicionar!(vetor::vetor, elemento::Int64)
    if vetor.tamanho == length(vetor.array)
        redimensionar!(vetor)
    end
    vetor.array[vetor.tamanho + 1] = elemento
    vetor.tamanho += 1
end

#função para obter um elemento em um determinado indice
function obter(vetor::Vetor, indice::Int64)
    if indice < 1 || indice > vetor.tamanho
        throw(BoundsError("indice fora dos limites"))
    end
    return vetor.array[indice]
end

#função para remover um elemento de um determinado índice
function remover!(vetor::Vetor, indice::Int64)
    if indice < 1 || indice > vetor.tamanho
        throw(BoundsError("indice fora dos limites"))
    end
    for i in indice:vetor.tamanho-1
        vetor.array[i] = vetor.array[i + 1]
    end
    vetor.tamanho -= 1
end

#função para redimensionar o vetor quando ele estiver cheio
function redimensionar(vetor::Vetor)
    novo_array = Vector{Int64}(undef, length(vetor.array) * 2)
    for i in 1:vetor.tamanho
        novo_array[i] = vetor.array[i]
    end
    vetor.array = novo_array
end

#função para retornar o tamanho do vetor
function tamanho(vetor::Vetor)
    return vetor.tamanho
end

#exemplo de uso
vetor = Vetor(5)

#adicionar elementos
adicionar!(vetor, 10)
adicionar!(vetor, 20)
adicionar!(vetor, 30)

# obter um elemento
println("elemento no índice 2: ", obter(vetor, 2))  # 20

#remover um elemento
remover!(vetor, 2)

#exibir o tamanho atual do vetor
println("tamanho do vetor: ", tamanho(vetor))  # 2

#exibir o novo valor no índice 2
println("novo elemento no índice 2: ", obter(vetor, 2))  # 30
