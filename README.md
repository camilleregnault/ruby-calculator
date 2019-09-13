# Ruby Calculator

**Ruby Calculator** est un projet de **calculatrice**.

A cette étape de développement la calculatrice gère l’addition, la soustraction, la multiplication et la division de deux nombres positifs et/ou négatifs.

Un temps de 0.5secondes a été ajouté afin de simuler un temps de calcul.

## Sujet:

Développer une calculatrice permettant d'additionner deux nombres. Elle répondra aux critères suivants :
- séparation du code entre un client web, un serveur distant
- le calcul doit s'effectuer sur le serveur distant et prendre quelques secondes (simuler un temps de calcul)

Pour information, seront jugés, entre autre : la qualité du code, la facilité d'installation et d’exécution, la documentation et l'ergonomie de l'ensemble. Pour le front et le back, le choix des langages et framework est libre.


## Les technologies utilisées:
- Ruby 2.6.2
- Rails 6.0.0
- Html5
- CSS3
- Bootstrap 4.2
- Node 10.16.0

## Installation:
- [Ruby 2.6 ou supérieur](https://www.ruby-lang.org/fr/documentation/installation/)
- [Rails 6.0 ou supérieur](https://guides.rubyonrails.org/v5.0/getting_started.html)
- [Rbenv](https://github.com/rbenv/rbenv) (Si plusieurs versions de Ruby sur le même environnement)
- [Node 10.16 ou superieur](https://nodejs.org/en/download/package-manager/)

###### Cloner le repository:
```
git clone https://github.com/camilleregnault/ruby-calculator.git
cd ruby-calculator/
yarn install
bundle install
```

## Lancement:
###### Lancement de l’application
```
rails s
```
Puis ouvrez **http://localhost:3000/** dans un navigateur pour utiliser l’application.

## Démo:
Projet hébergé sur [Heroku](https://www.heroku.com):

https://ruby-calc.herokuapp.com/calculator/

## Test:
###### Lancement des tests :
```
rspec spec/controllers/calculator_controller_spec.rb
```

Toutes les méthodes de la classe **CalculatorController** sont testées dans le fichier **spec/controllers/calculator_controller_spec.rb** afin d’avoir une bonne base de développement.
