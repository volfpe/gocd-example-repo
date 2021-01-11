FROM dtzar/helm-kubectl:3.4.2

COPY deploy.sh .

CMD sh deploy.sh