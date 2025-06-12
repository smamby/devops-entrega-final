# Entrega final de devOps

## Despliegue con docker compose
#### git clone https://github.com/smamby/listaTareas.git
#### copy .env al / del proyecto  
#### Si no se detacha los contenedores, se podra ver los logs de los test, pero se debera matar el proceso manualmente al finalizar los mismos.
docker-compose up --build  

#### Si se detachan (-d), los test se ejecutaran en segundo plano, y no se veran sus logs, habra que correrlos manualmente.
docker-compose up -d --build  
winpty docker exec -it listatareas-app-1 bash  
npm run test  
npm run test:integration  

#-