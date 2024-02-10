FROM alpine:3.19.1 AS base

WORKDIR /app
#COPY ./entrypoint.sh .
COPY . .
RUN echo "Building for $TARGETARCH"

RUN mkdir -p /source
RUN mkdir -p /destination

ENV SOURCE=/source
ENV DESTINATION=/destination

# dependency
RUN apk add  \
        rsync

ENTRYPOINT ["./entrypoint.sh"]
#CMD ["dotnet", "Thive.Tone.HanedaOperator.Service.dll"]