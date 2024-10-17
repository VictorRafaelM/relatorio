public class Fila{
    private int[] fila;
    private int frente;
    private int traseira;
    private int tamanho;
    private int capacidade;

    //construtor
    public Fila(int capacidade) {
        this.capacidade = capacidade;
        fila = new int[capacidade];
        frente = 0;
        traseira = -1;
        tamanho = 0;
    }

    //enqueue
    public void enfileirar(int elemento) {
        if (tamanho == capacidade) {
            System.out.println("fila cheia.");
        } else {
            traseira = (traseira + 1) % capacidade; //circular
            fila[traseira] = elemento;
            tamanho++;
        }
    }

    //dequeue
    public int desenfileirar() {
        if (estaVazia()) {
            throw new RuntimeException("fila vazia.");
        }
        int elemento = fila[frente];
        frente = (frente + 1) % capacidade; //circular
        tamanho--;
        return elemento;
    }

    //retorna o elemento da frente da fila sem remover
    public int frente() {
        if (estaVazia()) {
            throw new RuntimeException("fila vazia.");
        }
        return fila[frente];
    }

    //verifica se a fila está vazia
    public boolean estaVazia() {
        return tamanho == 0;
    }

    //retorna o tamanho da fila
    public int tamanho() {
        return tamanho;
    }

    public static void main(String[] args) {
        Fila fila = new Fila(5);

        //enfileira elementos
        fila.enfileirar(10);
        fila.enfileirar(20);
        fila.enfileirar(30);

        //mostra o elemento da frente
        System.out.println("Frente da fila: " + fila.frente()); // 10

        //desenfileira elementos
        System.out.println("elemento desenfileirado: " + fila.desenfileirar()); // 10
        System.out.println("nova frente da fila: " + fila.frente()); // 20

        //verifica se a fila está vazia
        System.out.println("a fila está vazia? " + fila.estaVazia()); // false

        //exibe o tamanho da fila
        System.out.println("tamanho da fila: " + fila.tamanho()); // 2
    }
}
