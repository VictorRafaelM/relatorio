public class lista {
    private int[] array;
    private int tamanho;

    //construtor
    public lista(int capacidade) {
        array = new int[capacidade];
        tamanho = 0;
    }

    //adiciona objeto no final
    public void adicionar(int elemento) {
        if (tamanho == array.length) {
            //redimensiona se n tem espaço
            redimensionar();
        }
        array[tamanho] = elemento;
        tamanho++;
    }

    //retorna o objeto
    public int obter(int indice) {
        if (indice < 0 || indice >= tamanho) {
            throw new IndexOutOfBoundsException("indice invalido");
        }
        return array[indice];
    }

    //remove o objeto
    public void remover(int indice) {
        if (indice < 0 || indice >= tamanho) {
            throw new IndexOutOfBoundsException("indice invalido");
        }
        for (int i = indice; i < tamanho - 1; i++) {
            array[i] = array[i + 1];
        }
        tamanho--;
    }

    //retorna a quantidade de objetos na lista
    public int tamanho() {
        return tamanho;
    }

    //redimensiona a lista qnd ta cheia
    private void redimensionar() {
        int[] novoArray = new int[array.length * 2];
        for (int i = 0; i < array.length; i++) {
            novoArray[i] = array[i];
        }
        array = novoArray;
    }

    public static void main(String[] args) {
        lista lista = new lista(5);

        //adiciona objeto
        lista.adicionar(10);
        lista.adicionar(20);
        lista.adicionar(30);
        
        //acessa objeto
        System.out.println("elemento no indice 1: " + lista.obter(1)); // 20

        //remove objeto no indice 1
        lista.remover(1);

        //mostra o tamanho da lista e o valor do indice
        System.out.println("tamanho da lista: " + lista.tamanho()); // 2
        System.out.println("novo elemento no indice 1: " + lista.obter(1)); // 30
    }
}
