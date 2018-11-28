# Make Your Own Adventure

App em Swift que utiliza arquivos plist para navegar entre histórias.

### Conceitos utilizados

No desenvolvimento deste app foram aprendidos os seguintes conceitos:

* Uso do `UINavigationController`
* Propriedades `navigationItem` e `navigationController` dos ViewControllers

### Changelog

#### v1.1

* Retira título customizado
* Retira o botão *Start Over* do início da história
* Simplificação da action `startOver`

#### v2.0

Reescrita do app para utilizar arquivos de dados para gerar as histórias!

* Utiliza arquivos plist para organizar os dados
* Faz o parse dos arquivos ao abrir o app e preenche um `UITableView` com várias aventuras
* Apresenta os créditos da aventura na primeira tela
* Utiliza arquivos de models para organizar os dados
* Abre o artigo original utilizando o `SFSafariViewController`
* Utiliza imagens para ilustrar as aventuras
