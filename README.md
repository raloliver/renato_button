# renato_button

  ```
  renato_button:
    git:
      url: https://github.com/Git-RenatoAlcantara/renato_button
 ```
   
## **Uso**</br>
 ##### import </br>
 
 Primeiro chamo classe RenatoButton <br>
 Passo a cor de fundo do botão</br>
 Tamanho total da tela que ao fim o botão ira ocupar
 Passo texto do botão
 Passo o estado 1 que será chamado apos o estado de loading.
 ```
RenatoButton(
   color: Colors.purpleAccent,
   progressColor: Colors.purple,
   endHeghtAnim: MediaQuery.of(context).size.height,
   textButton: Text('My Button'),
   //passando o estado do botão - primeiro estado é o um, ou seja o botão normal junto com o loading
   state: () {
     return 1;
   },
);
```

Exemplo com streambuilder:
```
StreamBuilder(
     stream: stateAnim.stream,
     initialData: 0,
     builder: (context, snapshot) {
         return RenatoButton(
          color: Colors.purpleAccent,
          progressColor: Colors.purple,
          //aqui defino o tamanho final que botão deverá ocupar ao fim do carregamento
          endHeghtAnim: MediaQuery.of(context).size.height,
          textButton: Text('My Button'),
          state: () {
            return snapshot.data;
          },
          );
  }),
```

![alt text](https://media.giphy.com/media/m9X2t8h1aAKnO4vrXZ/giphy.gif "Imagem de exemplo")




