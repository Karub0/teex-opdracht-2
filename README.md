# Weekopdracht 2 voor de cursus TEEX

## Introductie
In deze opdracht krijg je een front-end dat in React ontwikkeld is en een back-end dat in Spring Boot ontwikkeld is. 

De applicatie is geschikt om door een aantal toetsvragen heen te navigeren die beschikbaar zijn in de back-end. Je kunt je antwoord invoeren maar dat wordt niet opgeslagen en dat valt ook buiten de scope van deze opdracht.

Je hoeft in deze opdracht alleen aanpassingen te maken aan de front-end, de React code dus. 

## Test de applicatie
Run de back-end met Docker Compose:

```docker-compose up```

Run de front-end:

```npm run start```

Navigeer door de vragen, het zijn er 4. 

## Opdracht

In deze applicatie wordt de state op een wat onhandige manier gemanaged, er wordt gebruik gemaakt van prop drilling maar ook van function passing. Pas de applicatie zo aan dat er geen gebruik meer wordt gemaakt van prop drilling en function passing en werk hier twee varianten van uit:
1. Gebruik Composition.
2. Gebruik de Context API.

Maak voor beide varianten een aparte branch in je git repository. 
