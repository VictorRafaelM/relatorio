public class Pilha{
    private int[] pilha;
    private int topo;

    //construtor
    public Pilha(int capacidade) {
        pilha = new int[capacidade];
        topo = -1;
    }

    //push
    public void empilhar(int elemento) {
        if (topo == pilha.length - 1) {
            System.out.println("pilha cheia.");
        } else {
            topo++;
            pilha[topo] = elemento;
        }
    }

    //pop
    public int desempilhar() {
        if (topo == -1) {
            throw new RuntimeException("pilha vazia.");
        }
        int elemento = pilha[topo];
        topo--;
        return elemento;
    }

    //peek
    public int topo() {
        if (topo == -1) {
            throw new RuntimeException("pilha vazia.");
        }
        return pilha[topo];
    }

    //verifica se a pilha ta vazia
    public boolean estaVazia() {
        return topo == -1;
    }

    //retorna o tamanho da pilha
    public int tamanho() {
        return topo + 1;
    }

    public static void main(String[] args) {
        Pilha pilha = new Pilha(5);

        // empilha elementos
        pilha.empilhar(10);
        pilha.empilhar(20);
        pilha.empilhar(30);

        //printa elemento no topo
        System.out.println("topo da pilha: " + pilha.topo()); // 30

        //desempilha elementos
        System.out.println("elemento desempilhado: " + pilha.desempilhar()); // 30
        System.out.println("novo topo da pilha: " + pilha.topo()); // 20

        //verifica se a pilha ta vazia
        System.out.println("a pilha está vazia? " + pilha.estaVazia()); // false

        //mostra o tamanho da pilha
        System.out.println("tamanho da pilha: " + pilha.tamanho()); // 2
    }
}
