FROM bitnami/keycloak:12.0.4
USER root
RUN echo just do something > /dummy.txt
USER 1001
