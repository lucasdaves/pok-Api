# pokeapi

Nome: Lucas Daves de Melo Gonçalves
Email: lucas.guli.ld@gmail.com
Data do rebimento do email: 17/02/2021 (20 dias de contato)

Candidato para a vaga: Desenvolvedor Mobile.

O que foi feito:

1) tela de pesquisa
2) tela de resultados
3) tela do pokemon

4)Evoluções, tipo, imagem, habilidades, peso, e status(hp, attack, def, speed).

5)Gerenciamento de estados com Bloc

6)Comunicação com a API para buscar dados do pokemon

7)Layout utilizado: Sugerido pelo Figma

-------------------------------------------------------

Problemas conhecidos:

1) Faltante Widget FutureBuilder com método Future/Await quando carregando dados da API dentro de um StreamBuilder, assim pode haver retorno de "NULL" no snapshot em alguns momentos, porém o conteúdo é carregado normalmente e até bem rápido.

2) Widget delimitante de tela para Scrolling, podendo causar Overflow caso muita informação seja exibida.
